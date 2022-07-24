class ShiftsController < ApplicationController

  def create
    @organisation = Organisation.find(params[:organisation_id])
    @shift = Shift.new(shift_params)
    @shift.organisation = @organisation
    @shift.user = current_user
    if @shift.save
      redirect_to organisation_path(@organisation)
    else
      render "organisations/show"
    end    
  end

  private

  def shift_params
    @shift_params = params.require(:shift).permit(:start_date, :start_time, :finish, :break)
    
    @shift_params[:start] = DateTime.parse("#{@shift_params[:start_date]} #{@shift_params[:start_time]}")    
    @shift_params[:finish] = DateTime.parse("#{@shift_params[:start_date]} #{@shift_params[:finish]}")
    # calculation overnight shift according to the data 
    if @shift_params[:start] >= @shift_params[:finish]
      @shift_params[:finish] = DateTime.parse("#{DateTime.parse(@shift_params[:start_date]) + 1} #{@shift_params[:finish]}")
    end
    
    @shift_params
  end

end
