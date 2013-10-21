# encoding: utf-8
require "application_responder"

class ApplicationController < ActionController::Base
  has_mobile_fu
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  self.responder = ApplicationResponder
  respond_to :html, :json, :xml, :js

  before_filter :ensure_http_referer_is_set
  before_filter :set_locale
  before_filter :set_rails4bp_header
  before_filter :set_grammatical_gender
  before_filter :mobile_switch
  before_filter :gon_set_current_user
  before_filter :gon_set_global_config
  before_filter :gon_set_preloads

  before_filter :authenticate_user!

  inflection_method :grammatical_gender => :gender

  layout ->(c) {
    if user_signed_in?
      "marionette"
    else
      'public'
    end
  }

  def index
    gon.environment = Rails.env
    gon.rabl
    @user = User.first
    gon.rabl template: "app/views/users/show.json.rabl", as: "current_user"
  end

  def static

  end

  private

  def prepare_api_collection(search)
    [
        {
            :total_entries => search.total,
            :current_page => search.results.current_page,
            :total_pages => search.results.total_pages,
            :per_page => search.results.per_page
        },
        search.results
    ]
  end

  def ensure_http_referer_is_set
    request.env['HTTP_REFERER'] ||= '/'
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    # mobile_fu's is_mobile_device? wasn't working here for some reason...
    # it may have been just because of the test env.
    if request.env['HTTP_USER_AGENT'].match(/mobile/i)
      root_path
    else
      new_user_session_path
    end
  end

  def ensure_page
    params[:page] = params[:page] ? params[:page].to_i : 1
  end

  def set_rails4bp_header
    headers['X-rails4bp-Version'] = AppConfig.version_string

    if AppConfig.git_available?
      headers['X-Git-Update'] = AppConfig.git_update if AppConfig.git_update.present?
      headers['X-Git-Revision'] = AppConfig.git_revision if AppConfig.git_revision.present?
    end
  end

  def set_locale
    if user_signed_in?
      I18n.locale = current_user.language
    else
      locale = http_accept_language.preferred_language_from AVAILABLE_LANGUAGE_CODES
      locale ||= http_accept_language.compatible_language_from AVAILABLE_LANGUAGE_CODES
      locale ||= DEFAULT_LANGUAGE
      I18n.locale = locale
    end
  end

  def set_grammatical_gender
    if (user_signed_in? && I18n.inflector.inflected_locale?)
      gender = current_user.gender.to_s.tr('!()[]"\'`*=|/\#.,-:', '').downcase
      unless gender.empty?
        i_langs = I18n.inflector.inflected_locales(:gender)
        i_langs.delete I18n.locale
        i_langs.unshift I18n.locale
        i_langs.each do |lang|
          token = I18n.inflector.true_token(gender, :gender, lang)
          unless token.nil?
            @grammatical_gender = token
            break
          end
        end
      end
    end
  end

  def grammatical_gender
    @grammatical_gender || nil
  end

  # use :mobile view for mobile and :html for everything else
  # (except if explicitly specified, e.g. :json, :xml)
  def mobile_switch
    if session[:mobile_view] == true && request.format.html?
      request.format = :mobile
    elsif request.format.tablet?
      # we currently don't have any special tablet views...
      request.format = :html
    end
  end

  def max_time
    params[:max_time] ? Time.at(params[:max_time].to_i) : Time.now + 1
  end

  def gon_set_global_config
    gon.push({:config => AppConfig.settings})
  end

  def gon_set_current_user
    return unless user_signed_in?
    user = UserPresenter.new(current_user)
    gon.push({:user => user})
  end

  def gon_set_preloads
    return unless gon.preloads.nil?
    gon.preloads = {}
  end

end
