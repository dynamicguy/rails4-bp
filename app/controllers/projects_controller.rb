class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  respond_to :json, :xml, :js

  def index
    @search = Project.search do
      fulltext params[:q]
      order_by sort_column, sort_direction
      paginate :page => params[:page], :per_page => params[:per_page]
    end
    @projects = prepare_api_collection(@search)

    respond_to do |format|
      format.json { render json: @projects }
      format.xml { render xml: @projects }
    end
  end

  def show
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @project.save
    respond_with(@project)
  end

  def update
    @project.update(project_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :site_address, :topic_id, :created_uid, :modified_uid, :master, :domain, :private, :keyword_index, :theme, :token, :default_view, :user_view, :show_folder_icon, :show_page_icon, :toc_font_size, :toc_line_height, :primary_site, :lang, :primary_lang, :link_lang_sites, :ckfinder_delete, :favicon, :toc_visible, :filter_visible, :toc_width, :toc_bg_color, :toc_bold_folder, :toc_font_family, :enable_mobile, :phone_home, :tablet_home, :enable_mobile_css)
  end

  def sort_column
    Project.column_names.include?(params[:order]) ? params[:order] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:dir]) ? params[:dir] : "desc"
  end

end
