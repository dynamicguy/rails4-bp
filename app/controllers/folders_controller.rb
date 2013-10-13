class FoldersController < ApplicationController
  before_action :set_folder, only: [:show, :edit, :update, :destroy]
  respond_to :json, :xml, :js

  def index
    @search = Folder.search do
      fulltext params[:q]
      order_by sort_column, sort_direction
      paginate :page => params[:page], :per_page => params[:per_page]
    end
    @folders = prepare_api_collection(@search)

    respond_to do |format|
      format.json { render json: @folders }
      format.xml { render xml: @folders }
    end
  end

  def show
  end

  def new
    @folder = Folder.new
    respond_with(@folder)
  end

  def edit
  end

  def create
    @folder = Folder.new(folder_params)
    @folder.save
    respond_with(@folder)
  end

  def update
    @folder.update(folder_params)
    respond_with(@folder)
  end

  def destroy
    @folder.destroy
    respond_with(@folder)
  end

  private
  def set_folder
    @folder = Folder.find(params[:id])
  end

  def folder_params
    params.require(:folder).permit(:name, :parent_id, :project_id, :import_id, :deleted, :hidden, :toc_open, :link_url)
  end

  def sort_column
    Folder.column_names.include?(params[:order]) ? params[:order] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:dir]) ? params[:dir] : "desc"
  end

end
