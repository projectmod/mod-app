class OutletsController < ApplicationController
  before_action :set_outlet, only: :show

  def list
    Outlet.where(outlet_params)
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
