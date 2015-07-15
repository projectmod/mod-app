class Merchants::OutletsController < ApplicationController
  before_action :require_login
  before_action :set_outlet, only: [:show, :edit, :update]

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
    Role.find(current_user.id).merchant.outlets.each do |outlet| 
      if outlet.phone_no == current_user.phone_no 
        @outlet = outlet
      end
    end
  end

  def outlet_params
    params.require(:outlet).permit(:name, :address, :state, :price_range, :avatar, :type_of_service, :phone_no)
  end
end
