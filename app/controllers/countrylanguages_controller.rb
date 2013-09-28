class CountrylanguagesController < ApplicationController
  before_action :set_countrylanguage, only: [:view, :show, :edit, :update, :destroy]
  respond_to :html, :json
  #add_breadcrumb :language, :countrylanguages_path

  def search
    #params[:distinct] = 0
    add_breadcrumb :search
    @search = Countrylanguage.search(params[:q])
    @countrylanguages = params[:distinct].to_i.zero? ? @search.result.paginate(:page => params[:page]).order('id DESC') : @search.result(distinct: false).paginate(:page => params[:page]).order('id DESC')
    respond_with @countrylanguages
  end

  def advanced_search
    add_breadcrumb :advanced_search
    @search = Countrylanguage.search(params[:q])
    @search.build_grouping unless @search.groupings.any?
    @countrylanguages = params[:distinct].to_i.zero? ? @search.result.paginate(:page => params[:page]).order('id DESC') : @search.result(distinct: false).paginate(:page => params[:page]).order('id DESC')

    respond_with @countrylanguages
  end

  # GET /countrylanguages
  # GET /countrylanguages.json
  def index
    add_breadcrumb :list
    @countrylanguages = Countrylanguage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @countrylanguages }
      format.xml { render xml: @countrylanguages }
    end
  end

  # GET /countrylanguages/1
  # GET /countrylanguages/1.json
  def show
    add_breadcrumb :details
  end

  # GET /countrylanguages/new
  def new
    @countrylanguage = Countrylanguage.new
  end

  # GET /countrylanguages/1/edit
  def edit
  end

  # POST /countrylanguages
  # POST /countrylanguages.json
  def create
    @countrylanguage = Countrylanguage.new(countrylanguage_params)

    respond_to do |format|
      if @countrylanguage.save
        format.html { redirect_to @countrylanguage, notice: 'Countrylanguage was successfully created.' }
        format.json { render action: 'show', status: :created, location: @countrylanguage }
      else
        format.html { render action: 'new' }
        format.json { render json: @countrylanguage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countrylanguages/1
  # PATCH/PUT /countrylanguages/1.json
  def update
    respond_to do |format|
      if @countrylanguage.update(countrylanguage_params)
        format.html { redirect_to @countrylanguage, notice: 'Countrylanguage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @countrylanguage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countrylanguages/1
  # DELETE /countrylanguages/1.json
  def destroy
    @countrylanguage.destroy
    respond_to do |format|
      format.html { redirect_to countrylanguages_url }
      format.json { head :no_content }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_countrylanguage
    #@countrylanguage = Countrylanguage.where(language: params[:id].split('-').first, countrycode: params[:id].split('-').last).first
    @countrylanguage = Countrylanguage.find_by_slug(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def countrylanguage_params
    params.require(:countrylanguage).permit(:slug, :countrycode, :language, :isofficial, :percentage)
  end
end
