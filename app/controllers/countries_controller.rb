class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  respond_to :json, :xml, :js

  # GET /countries
  # GET /countries.json
  def index
    @search = Country.search do
      fulltext params[:q]
      order_by sort_column, sort_direction
      paginate :page => params[:page], :per_page => params[:per_page]
    end
    @countries = prepare_api_collection(@search)

    respond_to do |format|
      format.json { render json: @countries }
      format.xml { render xml: @countries }
    end
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
  end

  # GET /countries/new
  def new
    @country = Country.new
    respond_with(@country)
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(country_params)
    @country.save
    respond_with(@country)
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    @country.update(country_params)
    respond_with(@country)
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country.destroy
    respond_with(@country)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_country
    @country = Country.find_by_code params[:id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def country_params
    params.require(:country).permit(:code, :name, :continent, :region, :surfacearea, :indepyear, :population, :lifeexpectancy, :gnp, :gnpold, :localname, :governmentform, :headofstate, :capital, :code2)
  end

  def sort_column
    Country.column_names.include?(params[:order]) ? params[:order] : "code"
  end

  def sort_direction
    %w[asc desc].include?(params[:dir]) ? params[:dir] : "desc"
  end

end
