class CountrylanguagesController < ApplicationController
  before_action :set_countrylanguage, only: [:view, :show, :edit, :update, :destroy]
  respond_to :json, :xml, :js

  # GET /countrylanguages
  # GET /countrylanguages.json
  def index
    @search = Countrylanguage.search do
      fulltext params[:q]
      order_by sort_column, sort_direction
      paginate :page => params[:page], :per_page => params[:per_page]
    end
    @countrylanguages = prepare_api_collection(@search)
    respond_to do |format|
      format.json { render json: @countrylanguages }
      format.xml { render xml: @countrylanguages }
    end
  end

  # GET /countrylanguages/1
  # GET /countrylanguages/1.json
  def show
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
        format.json { render action: 'show', status: :created, location: @countrylanguage }
      else
        format.json { render json: @countrylanguage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countrylanguages/1
  # PATCH/PUT /countrylanguages/1.json
  def update
    respond_to do |format|
      if @countrylanguage.update(countrylanguage_params)
        format.json { head :no_content }
      else
        format.json { render json: @countrylanguage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countrylanguages/1
  # DELETE /countrylanguages/1.json
  def destroy
    @countrylanguage.destroy
    respond_to do |format|
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
    params.require(:countrylanguage).permit(:language, :countrycode, :slug, :isofficial, :percentage)
  end

  def sort_column
    Countrylanguage.column_names.include?(params[:order]) ? params[:order] : :language
  end

  def sort_direction
    %w[asc desc].include?(params[:dir]) ? params[:dir] : "desc"
  end

end
