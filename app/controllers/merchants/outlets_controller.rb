class Merchants::OutletsController < Merchants::BaseController
  before_action :set_outlet, except: [:new, :create]
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
      redirect_to(merchants_outlet_photos_path(@outlet), flash: { success: "You've updated your outlet!" })
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

  def set_available
    @outlet.update(availability: true)

    respond_with(@outlet)
  end

  def set_unavailable
    @outlet.update(availability: false)

    respond_with(@outlet)
  end

  private

  def set_outlet
    @outlet = current_user.outlet
  end

  def outlet_params
    params.require(:outlet).permit(:name, :address, :state, :price_range, :avatar, :type_of_service, :phone_no, images_attributes: [:id, :content])
  end
end
