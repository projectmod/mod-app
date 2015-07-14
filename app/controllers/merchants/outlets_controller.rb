class Merchants::OutletsController < ApplicationController
  before_action :require_login
  before_action :set_merchant, only: [:show, :edit]

  def show
  end

  def edit
  end

  private

  def set_outlet 
    @outlet = Role.find(current_user.id).merchant.outlets.map do |outlet| 
      outlet if outlet.phone_no == current_user.phone_no 
    end
  end

  def outlet_params
    params.require(:outlet).permit(:name, :address, :state, :price_range, :avatar, :type_of_service, :phone_no)
  end
end
