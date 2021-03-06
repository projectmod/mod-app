class Merchants::StepsController < ApplicationController
  include Wicked::Wizard
  steps :outlet_info, :services
  before_action :set_outlet
  before_action :verify_type_of_service, only: :update
  before_action :redirect_if_activated
  skip_before_action :require_login
  skip_before_action :is_merchant?

  def show
    # Render new empty working hours
    @outlet.working_hours.new if @outlet.working_hours.empty?
    render_wizard
  end

  def update
    @outlet.update(outlet_params(step))

    if step == :services
      @outlet.update(completed_registration: true)
    end

    render_wizard @outlet
  end

  private

  def finish_wizard_path
    merchants_success_path
  end

  def redirect_if_activated
    redirect_back_or_to root_path if current_user.try(:activated)
  end

  def verify_type_of_service
    return unless @step == :services
    raise "Error" unless params[:outlet][:price_range]
    params[:outlet][:type_of_service] = params[:outlet][:type_of_service].join(', ')
  rescue
    flash[:notice] = "Please complete your registration before submitting."
    redirect_to merchants_outlet_step_path(@outlet, "services")
  end

  def set_outlet
    @outlet = Outlet.find(params[:outlet_id])
  end

  def outlet_params(step)
    params.require(:outlet).permit(:name, :area, :address, :phone_number, :type_of_service, :price_range, :completed_registration, working_hours_attributes: [:id ,:days, :time])
  end
end
