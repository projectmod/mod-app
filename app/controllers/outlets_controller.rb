class OutletsController < ApplicationController
  before_action :set_outlet, except: :index
  before_action :outlet_search_validation, only: :index

  def index
    outlets = Outlet.where(price_range: params[:price_range], availability: true)
    @outlets = outlets.select { |o| o.type_of_service.include?(params[:type_of_service]) && o.user.credits > 0 }
    @outlets = Outlet.within_range(params[:longitude], params[:latitude], @outlets)
    @outlets = OutletDecorator.wrap(@outlets)
  end

  def show
    @booking = Booking.new
  end

  def preview
  end

  private

  def outlet_search_validation
    if params[:longitude].blank? && params[:latitude].blank?
      flash[:notice] = "We could not retrieve your current location. Please enable your browser to acquire your current location before searching."
      return redirect_to root_path
    end

    if params[:type_of_service].blank? || params[:price_range].blank?
      flash[:notice] = "Please select both the type of service and price range before proceeding. Thank you!"
      return redirect_to root_path
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
