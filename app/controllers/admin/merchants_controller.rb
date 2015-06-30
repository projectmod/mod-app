class Admin::MerchantsController < ApplicationController
  before_action :set_merchant, only: [:show, :update, :edit, :destroy]

  def index 
    @merchants = Merchant.all
  end  

  def show
  end

  def new
    @merchant = Merchant.new
  end

  def edit
  end

  def create 
    @merchant = Merchant.new(merchant_params)
    if @merchant.save
      redirect_to admin_merchants_path, notice: 'Merchant was successfully created.'
    else
      render :new, notice: 'error :#{@merchant.errors.full_messages}' 
    end
  end

  def update
    if @merchant.update(merchant_params)
      redirect_to admin_merchants_path, notice: 'Merchant was successfully updated'
    else
      render :edit, notice: "Update was not successful, please try again"
    end
  end

  def destroy
    @merchant.destroy
    redirect_to admin_merchants_path, notice: "Merchant was successfully deleted"
  end

  private

  def set_merchant
    @merchant = Merchant.find(params[:id])
  end

  def merchant_params 
    params.require(:merchant).permit(:name, :address, :type_of_service, :latitute, :longitude)
  end

end
