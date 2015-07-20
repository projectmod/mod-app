class PaymentTransactionsController < ApplicationController

  def new

  end

  def create
    hash = Digest::SHA256.hexdigest 'asdasds'
  end

  private

  def payment_transaction_params
    params.require(:payment_transaction).permit(:email, :name, :phone_no, :password, :password_confirmation)
  end
end
