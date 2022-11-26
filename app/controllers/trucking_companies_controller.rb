class TruckingCompaniesController < ApplicationController
    before_action :set_trucking_company, only: [:show, :edit, :update, :destroy]

  def show
    @trucking_company = TruckingCompany.find(params[:id])
  end

  def index
    #debugger
    @trucking_companies = TruckingCompany.paginate(page: params[:page], per_page: 4)
  end

  def new
    #debugger
    @trucking_company = TruckingCompany.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @trucking_company.update(trucking_company_params)
        format.html { redirect_to trucking_company_url(@trucking_company), notice: "Trucking Company was successfully updated..." }
        # format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end


  def create
    @trucking_company = TruckingCompany.new(trucking_company_params)

    #debugger
    respond_to do |format|
      if @trucking_company.save
        flash[:notice] = "Trucking Company saved successfully!!"
        format.html { redirect_to trucking_companies_url(@trucking_company) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @trucking_company.destroy
    redirect_to trucking_companies_path
  end

  private

  def set_trucking_company
    @trucking_company = TruckingCompany.find(params[:id])
  end

  def trucking_company_params
    params.require(:trucking_company)
    .permit(:code, :name, :scac_code)
  end

end
