class OrganisationsController < ApplicationController
  before_action :find_organisation, only: [:show, :edit, :update, :destroy]
  


  def index
    @organisations = Organisation.all
    @organisation = Organisation.new
  end

  def show
    @organisation = Organisation.find(params[:id])
    @shifts = Shift.where(organisation: @organisation.id).order(start: :desc)
    @shift = Shift.new()
  end

  def create
    @organisation = Organisation.new(organisation_params)
    if @organisation.save
      redirect_to organisations_path
    else
      render :index,  status: :unprocessable_entity
    end
  end



  def edit     
  end

  def update
    if @organisation.update(organisation_params)
      redirect_to organisations_path(@organisation)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy  
     
    @organisation.destroy
    redirect_to organisations_path, status: :see_other
  end

  

  private

  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end

  private

  def find_organisation
    @organisation = Organisation.find(params[:id])   
  end

end
