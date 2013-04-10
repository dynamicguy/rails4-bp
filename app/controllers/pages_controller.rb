class PagesController < ApplicationController
  include TheSortableTreeController::Rebuild
  before_action :set_page, only: [:show, :edit, :update, :destroy, :rebuild]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.nested_set.select(:id, :title, :content, :secret_field, :parent_id, :lft, :rgt, :depth).all
  end


  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    id        = params[:id].to_i
    parent_id = params[:parent_id].to_i
    prev_id   = params[:prev_id].to_i
    next_id   = params[:next_id].to_i

    render :text => "Do nothing" and return if parent_id.zero? && prev_id.zero? && next_id.zero?

    variable, collection, klass = self.the_define_common_variables
    variable = self.instance_variable_set(variable, klass.find(id))

    if prev_id.zero? && next_id.zero?
      variable.move_to_child_of klass.find(parent_id)
    elsif !prev_id.zero?
      variable.move_to_right_of klass.find(prev_id)
    elsif !next_id.zero?
      variable.move_to_left_of klass.find(next_id)
    end

    render(:nothing => true)

    #@page = Page.new(page_params)
    #
    #respond_to do |format|
    #  if @page.save
    #    format.html { redirect_to @page, notice: 'Page was successfully created.' }
    #    format.json { render action: 'show', status: :created, location: @page }
    #  else
    #    format.html { render action: 'new' }
    #    format.json { render json: @page.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end


  protected

  def sortable_model
    Page
  end

  def sortable_collection
    "pages"
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.find(page_params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def page_params
    params.permit(:title, :content, :secret_field, :parent_id, :lft, :rgt, :depth, :prev_id, :next_id, :id)
  end
end
