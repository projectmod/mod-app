class MerchantsController < ApplicationController
  before_action :set_merchant, only: :show

  def list
    Merchant.where(merchant_params)
  end

  def show
  end

  private

  def set_merchant
    @merchant = Merchant.find(params[:id])
  end

  def merchant_params
    params.require(:merchant).permit(:name, :address, :type_of_service, :latitude, :longitude, :price_range, :avatar)
  end

end
