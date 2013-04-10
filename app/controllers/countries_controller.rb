class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  add_breadcrumb :countries, :countries_path

  # GET /countries
  # GET /countries.json

  def search
    add_breadcrumb :search
    @search = Country.search(params[:q])
    @countries  = params[:distinct].to_i.zero? ? @search.result.page(params[:page]).per(15) : @search.result(distinct: true).page(params[:page]).per(15)
    respond_with @countries
  end

  def advanced_search
    add_breadcrumb :advanced_search
    @search = Country.search(params[:q])
    @search.build_grouping unless @search.groupings.any?
    @countries  = params[:distinct].to_i.zero? ? @search.result.page(params[:page]).per(15) : @search.result(distinct: true).page(params[:page]).per(15)

    respond_with @countries
  end

  def index
    add_breadcrumb :list

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: CountriesDatatable.new(view_context) }
      format.xml { render xml: Country.all }
    end
  end
  # GET /countries/1
  # GET /countries/1.json
  def show
    add_breadcrumb :details
  end

  # GET /countries/new
  def new
    add_breadcrumb :new
    @country = Country.new
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries
  # POST /countries.json
  def create
    add_breadcrumb :create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: 'Country was successfully created.' }
        format.json { render action: 'show', status: :created, location: @country }
      else
        format.html { render action: 'new' }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to @country, notice: 'Country was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to countries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_params
      params.require(:country).permit(:code, :name, :continent, :region, :surfacearea, :indepyear, :population, :lifeexpectancy, :gnp, :gnpold, :localname, :governmentform, :headofstate, :capital, :code2)
    end
end
