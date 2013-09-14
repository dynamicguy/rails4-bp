class CrewsController < ApplicationController
  before_action :set_crew, only: [:show, :edit, :update, :destroy]
  respond_to :json

  def index
    @crew = Crew.all
  end

  def show
    # sleep 5
    @member = Crew.find params[:id]
  end

  def update
    sleep 2
    @member = Crew.find params[:id]
    if @member.update_attributes crew_params
      render "crews/show"
    else
      respond_with @member
    end
  end

  def create
    @member = Crew.new
    if @member.update_attributes crew_params
      render "crews/show"
    else
      respond_with @member
    end
  end

  def destroy
    member = Crew.find params[:id]
    member.destroy()
    render json: {}
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_crew
    @crew = Crew.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def crew_params
    params.require(:crew).permit(:age, :name, :avatar, :title, :species, :origin, :quote)
  end
end
