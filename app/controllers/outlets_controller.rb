class OutletsController < ApplicationController
  before_action :set_outlet, only: [:show, :preview]
  before_action :check_user_location, only: :index

  def index
    outlets = Outlet.where(price_range: params[:price_range], availability: true)
    @outlets = outlets.select { |o| o.type_of_service.include?(params[:type_of_service]) && o.credits > 0 }
    @outlets = Outlet.within_range(params[:longitude], params[:latitude], @outlets)
    @outlets = OutletDecorator.wrap(@outlets)
  end

  def show
    @booking = Booking.new
  end

  def preview
  end

  private

  def check_user_location
    if params[:longitude] == "" && params[:latitude] == ""
      flash[:error] = "We could not retrieve your current location. Please enable your browser to acquire your current location before searching."
      redirect_to_root_path
    end
  end

  def set_outlet
    @outlet = Outlet.find(params[:id])
    @outlet = OutletDecorator.new(@outlet)
  end

  def outlet_params
    params.require(:outlet).permit(:name, :address, :type_of_service, :latitude, :longitude, :price_range, :avatar, :availability)
  end
end
