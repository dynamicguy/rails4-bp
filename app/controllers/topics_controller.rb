class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  respond_to :json, :xml, :js

  # GET /topics
  # GET /topics.json  
  def index
    @search = Topic.search do
      fulltext params[:q]
      order_by sort_column, sort_direction
      paginate :page => params[:page], :per_page => params[:per_page]
    end
    @topics = prepare_api_collection(@search)

    respond_to do |format|
      format.json { render json: @topics }
      format.xml { render xml: @topics }
    end
  end


  # GET /topics/1
  # GET /topics/1.json  
  def show
  end

  def new
    @topic = Topic.new
    respond_with(@topic)
  end

  # GET /topics/1/edit
  def edit
  end


  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)
    @topic.save
    respond_with(@topic)
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json  
  def update
    @topic.update(topic_params)
    respond_with(@topic)
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_with(@topic)
  end

  private
  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:topic_id, :topic_type, :topic_title, :topic_status, :topic_toc, :toc_name, :topic_index, :index_name, :topic_permalink, :topic_content, :prj_id, :folder_id, :deleted, :created_time, :created_uid, :modified_time, :modified_uid, :deleted_time, :deleted_uid, :undeleted_uid, :undeleted_time, :comp_id, :topic_size, :has_feedback, :good, :bad, :show_in_pdf, :import_id, :duplicated_id, :toc_hidden, :keywords, :inc_search, :working, :toc_open)
  end

  def sort_column
    Topic.column_names.include?(params[:order]) ? params[:order] : "topic_id"
  end

  def sort_direction
    %w[asc desc].include?(params[:dir]) ? params[:dir] : "desc"
  end

end
