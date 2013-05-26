class CategoriesController < ApplicationController
  include TheSortableTreeController::Rebuild
  before_action :set_category, only: [:show, :edit, :update, :destroy, :rebuild]
  add_breadcrumb :categories, :categories_path
  # GET /categories
  # GET /categories.json
  def index
    add_breadcrumb :list
    @categories = Category.nested_set.select(:id, :title, :content, :secret_field, :parent_id, :lft, :rgt, :depth).page(params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: CategoriesDatatable.new(view_context) }
      format.xml { render xml: Category.all }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    add_breadcrumb :details
    @categories = Category.nested_set.select(:id, :title, :content, :secret_field, :parent_id, :lft, :rgt, :depth).page(params[:page])
  end

  # GET /categories/new
  def new
    add_breadcrumb :new
    @categories = Category.nested_set.select(:id, :title, :content, :secret_field, :parent_id, :lft, :rgt, :depth).page(params[:page])
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    add_breadcrumb :edit
    @categories = Category.nested_set.select(:id, :title, :content, :secret_field, :parent_id, :lft, :rgt, :depth).page(params[:page])
  end

  # POST /categories
  # POST /categories.json
  def create
    if request.xhr?
      id = params[:id].to_i
      parent_id = params[:parent_id].to_i
      prev_id = params[:prev_id].to_i
      next_id = params[:next_id].to_i

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
    else
      @category = Category.new(category_params)
      respond_to do |format|
        if @category.save
          format.html { redirect_to @category, notice: 'Category was successfully created.' }
          format.json { render action: 'show', status: :created, location: @category }
        else
          format.html { render action: 'new' }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  protected

  def sortable_model
    Category
  end

  def sortable_collection
    "categories"
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(category_params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.permit(:id, :title, :content, :secret_field, :parent_id, :lft, :rgt, :depth, :prev_id, :next_id)
  end
end
