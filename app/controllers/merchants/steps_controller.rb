class Merchants::StepsController < ApplicationController
  include Wicked::Wizard
  steps :salon_info, :services
  before_action :set_outlet
  before_action :verify_type_of_service, only: :update

  def show
    render_wizard
  end

  def update
    @outlet.update(outlet_params(step))

    render_wizard @outlet
  end

  private

  def finish_wizard_path
    merchants_success_path
  end

  def verify_type_of_service
    if @step == :services && outlet_params(@step)[:type_of_service].nil?
      flash[:error] = "Please select at least one type of service before submitting."
      redirect_to merchants_outlet_step_path(@outlet, "services")
    end
  end

  def set_outlet
    @outlet = Outlet.find(params[:outlet_id])
  end

  def outlet_params(step)
    params.require(:outlet).permit(:name, :area, :address, :phone_no, :working_hours, { type_of_service: [] }, :price_range)
  end
end