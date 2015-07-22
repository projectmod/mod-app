class Payment
  attr_accessor :payment

  def initialize(payment)
    @payment = payment
  end

  def get_link
    ("https://test2pay.ghl.com/IPGSG/Payment.aspx?" + "&TransactionType=SALE" + "&PymtMethod=" + 
     payment.payment_method + "&ServiceID=sit" + "&PaymentID=" + payment.payment_transaction.id + "&OrderNumber=" + 
     package.id + "&PaymentDesc=" + payment.package.description + "&MerchantReturnURL=" + "#{success_url}" + 
     "&Amount=" + payment.package.price + "&CurrencyCode=MYR" + "&HashValue=" + payment.hash_value + "&CustIP" +
     payment.ip_address + "&CustName=" payment.user.first_name + payment.user.last_name + "&CustEmail=" + payment.user.email + 
     "&CustPhone=" + payment.user.phone_no + "&MerchantName=MOD" + "&MerchantCallBackURL=" + "#{success_url}" +
     "&PageTimeout=780")
  end

  private

  def hash_value
    message = password + "sit" + payment_transaction.id + "#{success_url}" + package.price + "MYR" + ip_address + "780"

    Digest::SHA256.hexdigest(message)
  end
end
