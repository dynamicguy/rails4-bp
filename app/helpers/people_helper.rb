module PeopleHelper
  include ERB::Util

  def search_header
    if search_query.blank?
      content_tag(:h2, t('people.index.no_results'))
    else
      content_tag(:h2, :id => 'search_title') do
        t('people.index.results_for').html_safe + ' ' +
        content_tag(:span, search_query, :class => 'term')
      end
    end
  end

  def search_or_index
    if search_query
      I18n.t 'people.helper.results_for',:params => search_query
    else
      I18n.t "people.helper.people_on_pod_are_aware_of"
    end
  end

  def birthday_format(bday)
    if bday.year == 1000
      I18n.l bday, :format => I18n.t('date.formats.birthday')
    else
      I18n.l bday, :format => I18n.t('date.formats.birthday_with_year')
    end
  end

  def user_link(user, opts={})
    opts[:class] ||= ""
    opts[:class] << " self" if defined?(user_signed_in?) && user_signed_in? && current_user.user == user
    remote_or_hovercard_link = Rails.application.routes.url_helpers.user_path(user).html_safe
    "<a data-hovercard='#{remote_or_hovercard_link}' #{user_href(user)} class='#{opts[:class]}' #{ ("target=" + opts[:target]) if opts[:target]}>#{h(user.name)}</a>".html_safe
  end

  def last_visible_post_for(user, current_user=nil)
    unless Post.visible_from_author(user, current_user).empty?
      link_to(t('people.last_post'), last_post_user_path(user.to_param))
    end
  end

  def user_image_tag(user, size = :thumb_small)
    image_tag(user.profile.image_url(size), :alt => user.name, :class => 'avatar', :title => user.name, 'data-user_id' => user.id)
  end

  def user_image_link(user, opts={})
    return "" if user.nil? || user.profile.nil?
    if opts[:to] == :photos
      link_to user_image_tag(user, opts[:size]), user_photos_path(user)
    else
      "<a #{user_href(user)} class='#{opts[:class]}' #{ ("target=" + opts[:target]) if opts[:target]}>
      #{user_image_tag(user, opts[:size])}
      </a>".html_safe
    end
  end

  def user_href(user, opts={})
    "href=\"#{local_or_remote_user_path(user, opts)}\"".html_safe
  end

  # Rails.application.routes.url_helpers is needed since this is indirectly called from a model
  def local_or_remote_user_path(user, opts={})
    opts.merge!(:protocol => AppConfig.pod_uri.scheme, :host => AppConfig.pod_uri.authority)
    absolute = opts.delete(:absolute)

    if user.local?
      username = user.rails4bp_handle.split('@')[0]
      unless username.include?('.')
        opts.merge!(:username => username)
        if absolute
          return Rails.application.routes.url_helpers.user_profile_url(opts)
        else
          return Rails.application.routes.url_helpers.user_profile_path(opts)
        end
      end
    end

    if absolute
      return Rails.application.routes.url_helpers.user_url(user, opts)
    else
      return Rails.application.routes.url_helpers.user_path(user, opts)
    end
  end

  def sharing_message(user, contact)
    if contact.sharing?
      content_tag(:div, :class => 'sharing_message_container', :title => I18n.t('people.helper.is_sharing', :name => user.name)) do
        content_tag(:div, nil, :class => 'icons-check_yes_ok', :id => 'sharing_message')
      end
    else
      content_tag(:div, :class => 'sharing_message_container', :title => I18n.t('people.helper.is_not_sharing', :name => user.name)) do
        content_tag(:div, nil, :class => 'icons-circle', :id => 'sharing_message')
      end
    end
  end

  def profile_buttons_class(contact, block)
    if block.present?
      'blocked'
    elsif contact.mutual?
      'mutual'
    elsif contact.sharing?
      'only_sharing'
    elsif contact.receiving?
      'receiving'
    else
      'not_sharing'
    end
  end
end
