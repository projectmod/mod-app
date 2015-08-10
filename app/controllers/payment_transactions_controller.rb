class PaymentTransactionsController < ApplicationController

  def new
    @packages = Package.all
    @payment_transaction = PaymentTransaction.new
  end

  def create
    # Needs refactoring
    if @payment_transaction = PaymentTransaction.create(payment_transaction_params)
      @package = Package.find(params[:payment_transaction][:package_id])
      new_params = OpenStruct.new(payment_method: params[:payment_transaction][:payment_method], 
                    payment_transaction_id: @payment_transaction.id.to_s,
                    package_id: @package.id.to_s, package_description: @package.description,
                    package_price: @package.price.to_s, ip_address: "127.0.0.1", user_name: current_user.name,
                    user_email: current_user.email, user_phone_no: current_user.phone_no)

      redirect_to @payment_link = Payment.new(new_params).get_link
    else
      redirect_to :back, notice: "Purchase unsuccesful, please try again"
    end
  end

  def success
    
  end

  private

  def payment_transaction_params
    params.require(:payment_transaction).permit(:price, :receipt_code, :payment_method, :package_id)
  end
end
