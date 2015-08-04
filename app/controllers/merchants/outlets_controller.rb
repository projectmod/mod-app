class Merchants::OutletsController < Merchants::BaseController
  before_action :set_outlet, only: [:show, :edit, :update]

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

  private

  def set_outlet
    # @outlet = current_user.outlet
  end

  def outlet_params
    params.require(:outlet).permit(:name, :address, :state, :price_range, :avatar, :type_of_service, :phone_no)
  end
end
