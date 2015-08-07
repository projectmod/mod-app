class Merchants::StepsController < ApplicationController
  include Wicked::Wizard
  steps :salon_info, :services

  def show
    @outlet = Outlet.find(params[:outlet_id])
    render_wizard
  end

  def update
    @outlet = Outlet.find(params[:outlet_id])
    binding.pry
    @outlet.update(outlet_params(step))
    render_wizard @outlet
  end

  private

  def outlet_params(step)
    params.require(:outlet).permit(:name, :area, :address, :phone_no, :working_hours, :type_of_service, :price_range)
  end
end
