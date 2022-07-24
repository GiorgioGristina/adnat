class OrganisationsController < ApplicationController
  def index
    @organisations = Organisation.all
    @organisation = Organisation.new
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
    @organisation = Organisation.find(params[:id])    
  end

  def update
    @organisation = Organisation.find(params[:id])
    if @organisation.update(organisation_params)
      redirect_to organisations_path(@organisation)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end

end
