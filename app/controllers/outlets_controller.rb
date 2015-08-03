class OutletsController < ApplicationController
  before_action :set_outlet, only: :show

  def index
    @outlets = Outlet.where(price_range: params[:price_range], availability: true)

    @final = []
    @outlets.each do |outlet|
      outlet.type_of_service.each do |service|
        @final << outlet if service == params[:type_of_service]
      end
    end

    @final = Outlet.within_range(params[:longitude], params[:latitude], @final)
  end

  def show
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
