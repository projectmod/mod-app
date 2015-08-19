class Payment::Merchant
  attr_accessor :user, :ip, :params

  def initialize(user, ip, params)
    @user = user
    @ip = ip
    @params = params
  end

  def get_link
    @payment_id = create_payment_id
    package.payment_transactions.create(payment_id: @payment_id, user_id: user.id)

    ( ENV['MERCHANT_URL'] + "?" + "TransactionType=SALE" + "&PymtMethod=" +
     params[:payment_method] + "&ServiceID=sit" + "&PaymentID=" + @payment_id + "&OrderNumber=" +
     @payment_id + "&PaymentDesc=" + package.description + "&MerchantReturnURL=" + ENV['MERCHANT_RETURN_URL'] +
     "&Amount=" + package_price + "&CurrencyCode=MYR" + "&HashValue=" + hash_value + "&CustIP=" +
     ip + "&CustName=" + user.name + "&CustEmail=" + user.email + "&CustPhone=" + user.phone_number +
     "&MerchantName=MOD" + "&MerchantApprovalURL=" + ENV['MERCHANT_SUCCESS_URL'] + "&MerchantUnApprovalURL=" + ENV['MERCHANT_FAILURE_URL'] +
     "&PageTimeout=300")
  end

  private

  def package
    Package.find_by(id: params[:package_id])
  end

  def package_price
    "%.2f" % package.price
  end

  def hash_value
    message = ("sit12345" + "sit" + @payment_id + ENV['MERCHANT_RETURN_URL'] + ENV['MERCHANT_SUCCESS_URL'] + ENV['MERCHANT_FAILURE_URL'] +
              package_price + "MYR" + ip + "300")

    Digest::SHA256.hexdigest(message)
  end

  def create_payment_id
    loop do
      id =  SecureRandom.hex(5)
      break id unless PaymentTransaction.where(payment_id: id).exists?
    end
  end
end
