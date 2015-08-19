class Merchants::OutletsController < Merchants::BaseController
  before_action :set_outlet
  before_action :destroy_empty_working_hours, only: :update
  before_action :verify_type_of_service, only: :update
  respond_to :js

  def show
  end

  def edit
  end

  def update
    if @outlet.update(outlet_params)
      redirect_to(:back, flash: { success: "You've updated your outlet!" })
    else
      render :edit, notice: "Update failed. Please try again."
    end
  end

  def customize
    @outlet = OutletDecorator.new(@outlet)

    # Create empty working hour
    @outlet.working_hours.new if @outlet.working_hours.empty?
  end

  def photos
    @outlet = OutletDecorator.new(@outlet)

    buildable_photos = 6 - @outlet.images.length
    buildable_photos.times do
      @outlet.images.build
    end
  end

  def refresh_availability
    respond_with(@outlet)
  end

  def toggle_availability
    toggle = @outlet.availability ? false : true

    if current_user.credits > 1
      @outlet.update(availability: toggle)
    else
      flash[:error] = "You currently do not have enough credits to set your availability to true. Please purchase more credits."
    end

    respond_with(@outlet)
    flash.clear
  end

  private

  def verify_type_of_service
    params[:outlet][:type_of_service] = params[:outlet][:type_of_service].join(', ')
    if outlet_params[:type_of_service].nil?
      flash[:error] = "Please select at least one type of service before submitting."
      redirect_to merchants_outlet_step_path(@outlet, "services")
    end
  end

  def destroy_empty_working_hours
    params[:outlet][:working_hours_attributes].select { |k,v| v["days"].blank? || v["time"].blank? ? v["_destroy"] = "1" : v["_destroy"] = "0" }
  rescue
  end

  def set_outlet
    @outlet = current_user.outlet
    authorize @outlet
  end

  def outlet_params
    params.require(:outlet).permit(:id, :name, :address, :state, :price_range, :avatar, :type_of_service, :phone_number, images_attributes: [:id, :content], working_hours_attributes: [:id ,:days, :time, :_destroy])
  end
end
