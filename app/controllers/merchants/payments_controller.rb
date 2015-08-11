class Merchants::PaymentsController < Merchants::BaseController

  def new
    @packages = Package.all
    @payment_transaction = PaymentTransaction.new
    @payment_methods = Payment::Methods.new.fetch
  end

  def create
    user_ip = request.remote_ip
    payment_link = Payment::Merchant.new(current_user, user_ip, payment_transaction_params).get_link

    if payment_link
      redirect_to payment_link
    else
      flash[:error] = "We ran into some issues contacting the payment gateway, please try again!"
      render :new
    end
  end

  def success
  end

  private

  def payment_transaction_params
    params.require(:payment_transaction).permit(:price, :receipt_code, :payment_method, :package_id)
  end
end
