class Merchants::MerchantsController < ApplicationController
  before_action :set_merchant, only: [:show, :edit]

  def show
  end

  def edit
  end

  private

  def set_merchant
    @merchant = current_user if current_user.roles.each { |role| role.role ==  "merchant" }
  end
end
