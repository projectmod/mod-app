class Merchants::OutletsController < Merchants::BaseController
  before_action :set_outlet, except: [:new, :create]
  before_action :destroy_empty_working_hours, only: :update
  respond_to :js

  def new
    @outlet = Outlet.new
  end

  def create
    @outlet = Outlet.new(outlet_params)

    if @outlet.save
      # flash[:notice]
      redirect_to edit_merchants_outlets_path(@outlet, "services")
    else
      redirect_to new_merchants_outlets_path
    end
  end

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

    if @outlet.credits > 1
      @outlet.update(availability: toggle)
    else
      flash[:error] = "You currently do not have enough credits to set your availability to true. Please purchase more credits."
    end

    respond_with(@outlet)
    flash.clear
  end

  private

  def destroy_empty_working_hours
    deleteable_working_hours = params[:outlet][:working_hours_attributes].select { |k,v| v["days"].blank? || v["time"].blank? }
    deleteable_working_hours.each { |k,v| v["_destroy"] = "1" }
  end

  def set_outlet
    @outlet = current_user.outlet
  end

  def outlet_params
<<<<<<< HEAD
    params.require(:outlet).permit(:name, :address, :state, :price_range, :avatar, :type_of_service, :phone_number, images_attributes: [:id, :content])
=======
    params.require(:outlet).permit(:id, :name, :address, :state, :price_range, :avatar, :type_of_service, :phone_number, images_attributes: [:id, :content], working_hours_attributes: [:id ,:days, :time, :_destroy])
>>>>>>> junxian/polish
  end
end
