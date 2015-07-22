class PaymentTransactionsController < ApplicationController

  def new
    @packages = Package.all
    @payment_transaction = PaymentTransaction.new
  end

  def create
    if @payment = PaymentTransaction.create(payment_transaction_params)
      redirect_to @payment_link = Payment.new(payment_transactions_params).get_link
    else
      redirect_to :back, notice: "Purchase unsuccesful, please try again"
    end
  end

  def success
    
  end

  private

  def payment_transaction_params
    params.require(:payment_transaction).permit(:email, :name, :phone_no, :password, :password_confirmation)
  end
end
