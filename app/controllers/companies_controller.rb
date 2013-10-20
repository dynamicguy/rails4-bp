class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  respond_to :json, :xml, :js

  # GET /companies
  # GET /companies.json
  def index
    @search = Company.search do
      fulltext params[:q]
      order_by sort_column, sort_direction
      paginate :page => params[:page], :per_page => params[:per_page]
    end
    @companies = prepare_api_collection(@search)

    respond_to do |format|
      format.json { render json: @companies }
      format.xml { render xml: @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    @company.save
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json  
  def update
    @company.update(company_params)
    respond_with @company
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_with @company
  end

  private
  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:comp_name, :status, :hidden, :created_uid, :modified_uid, :global_admin, :website, :phone, :ssl)
  end

  def sort_column
    Company.column_names.include?(params[:order]) ? params[:order] : "comp_id"
  end

  def sort_direction
    %w[asc desc].include?(params[:dir]) ? params[:dir] : "desc"
  end


end
