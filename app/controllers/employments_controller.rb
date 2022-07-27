class EmploymentsController < ApplicationController

  def create
    @organisation = Organisation.find(params[:organisation_id])
    @employment = Employment.new(user:current_user, organisation: @organisation)
    if @employment.save
      redirect_to organisations_path
    else
      render "organisations/index", status: :unprocessable_entity
    end
  end

  def destroy
    @employment = Employment.find(params[:id])
    if @employment.destroy
      redirect_to organisations_path
    else
      render "organisation/index", status: :see_other
    end   
  end

end
