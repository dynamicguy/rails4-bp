class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  #add_breadcrumb :cities, :cities_path

  respond_to :html, :json
  # GET /cities
  # GET /cities.json

  def search
    add_breadcrumb :search
    @search = City.search(params[:q])
    @cities  = params[:distinct].to_i.zero? ? @search.result.page(params[:page]).per(15) : @search.result(distinct: true).page(params[:page]).per(15)
    respond_with @cities
  end

  def advanced_search
    add_breadcrumb :advanced_search
    @search = City.search(params[:q])
    @search.build_grouping unless @search.groupings.any?
    @cities  = params[:distinct].to_i.zero? ? @search.result.page(params[:page]).per(15) : @search.result(distinct: true).page(params[:page]).per(15)

    respond_with @cities
  end

  def index
    add_breadcrumb :list

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: CitiesDatatable.new(view_context) }
      format.xml { render xml: City.all }
    end
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
    add_breadcrumb :details
  end

  # GET /cities/new
  def new
    add_breadcrumb :new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
    add_breadcrumb :edit
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully created.' }
        format.json { render action: 'show', status: :created, location: @city }
      else
        format.html { render action: 'new' }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: 'City was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:name, :countrycode, :district, :population)
    end
end
