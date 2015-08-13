class Merchants::OutletsController < Merchants::BaseController
  before_action :set_outlet, only: [:show, :edit, :update, :customize, :photos, :upload_photos]

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
      redirect_to show_outlet_path(@outlet), notice: "Update was successful"
    else
      render :edit, notice: "Update failed. Please try again."
    end
  end

  def customize
    @outlet = OutletDecorator.new(@outlet)
  end

  def photos
    @uploadable_photos = 6
    @outlet = OutletDecorator.new(@outlet)
  end

  def upload_photos
    photo_params.each do |photo|
      @outlet.images.create(content: photo[1])
    end

    redirect_to merchants_outlet_photos_path(@outlet)
  end

  private

  def set_outlet
    @outlet = current_user.outlet
  end

  def photo_params
    params.require(:outlet_images).permit(:photo0, :photo1, :photo2, :photo3, :photo4, :photo5)
  end

  def outlet_params
    params.require(:outlet).permit(:name, :address, :state, :price_range, :avatar, :type_of_service, :phone_no)
  end
end
