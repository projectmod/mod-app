class OutletsController < ApplicationController
  before_action :set_outlet, only: :show

  def list
    @outlets = Outlet.where(price_range: params[:price_range])
    @final = []
    @outlets.each do |outlet|
      outlet.type_of_service.select do |service| 
        @final << outlet if params[:type_of_service].include?(service)
      end
    end 
  end

  def show
  end

  private

  def set_outlet
    @outlet = Outlet.find(params[:id])
  end

  def outlet_params
    params.require(:outlet).permit(:name, :address, :type_of_service, :latitude, :longitude, :price_range, :avatar)
  end

end
