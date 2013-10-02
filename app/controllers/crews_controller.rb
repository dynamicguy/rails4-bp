class CrewsController < ApplicationController
  before_action :set_crew, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json, :xml, :js
  responders :collection, Responders::PaginateResponder

  # GET /crews
  # GET /crews.json
  def index
    @crews = Crew.all.paginate(:page => params[:page]).order("#{params[:order]} #{params[:dir]}")
    respond_to do |format|
      format.json { render json: @crews }
      format.xml { render xml: @crews }
    end
    #respond_with @crews
  end

  # GET /crews/1
  # GET /crews/1.json
  def show
    @crew = Crew.find params[:id]
  end


  # PATCH/PUT /crews/1
  # PATCH/PUT /crews/1.json
  def update
    respond_to do |format|
      if @crew.update(crew_params)
        format.html { redirect_to @crew, notice: 'Crew was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @crew.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /crews
  # POST /crews.json
  def create
    @crew = Crew.new(crew_params)

    respond_to do |format|
      if @crew.save
        format.html { redirect_to @crew, notice: 'Crew was successfully created.' }
        format.json { render action: 'show', status: :created, location: @crew }
      else
        format.html { render action: 'new' }
        format.json { render json: @crew.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /crews/1
  # DELETE /crews/1.json
  def destroy
    @crew.destroy
    respond_to do |format|
      format.html { redirect_to crews_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_crew
    @crew = Crew.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def crew_params
    params.require(:crew).permit(:id, :age, :name, :avatar, :title, :species, :origin, :quote)
  end
end