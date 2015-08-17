class Merchants::PaymentTransactionsController < Merchants::BaseController
  protect_from_forgery with: :null_session
  before_action :set_payment_transaction, except: :create

  def create
    transaction = PaymentTransaction.find_by(payment_id: params[:PaymentID])

    if transaction && params[:TxnMessage] == "Transaction+Successful"
      transaction.update(price: params[:Amount], payment_method: params[:PymtMethod],
                         payment_id: params[:PaymentID], bank_ref_no: params[:BankRefNo])

      current_credits = transaction.user.outlet.credits
      transaction.user.outlet.update(credits: current_credits + transaction.package.credits)

      redirect_to success_merchants_payment_transaction_path(transaction)
    else
      redirect_to merchants_pricings_path
    end
  end

  def success
  end

  def failure
  end

  private

  def set_payment_transaction
    @payment_transaction = PaymentTransaction.find_by(id: params[:id])
  end
end
