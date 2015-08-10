class OutletsController < ApplicationController
  before_action :set_outlet, only: :show

  def index
    outlets = Outlet.where(price_range: params[:price_range], availability: true)
    @outlets = outlets.select { |o| o.type_of_service.include?(params[:type_of_service]) }
    @outlets = Outlet.within_range(params[:longitude], params[:latitude], @outlets)
    @outlets = OutletDecorator.wrap(@outlets)
  end

  def show
    @outlet = OutletDecorator.new(@outlet)
    @booking = Booking.new
  end

  private

  def set_outlet
    @outlet = Outlet.find(params[:id])
  end

  def outlet_params
    params.require(:outlet).permit(:name, :address, :type_of_service, :latitude, :longitude, :price_range, :avatar, :availability)
  end

end
