class Merchants::PaymentTransactionsController < Merchants::BaseController
  protect_from_forgery with: :null_session

  def create
    transaction = PaymentTransaction.find_by(payment_id: params[:PaymentID])

    if transaction && params[:TxnMessage] == "Transaction+Successful"
      transaction.update(price: params[:Amount], payment_method: params[:PymtMethod],
                         payment_id: params[:PaymentID], bank_ref_no: params[:BankRefNo])

      current_credits = transaction.user.outlet.credits
      transaction.user.outlet.update(credits: current_credits + transaction.package.credits)

      redirect_to merchants_dashboard_path
    else
      redirect_to merchants_pricings_path
    end
  end

  def success
  end

  def failure
  end
end
