class Payment
  attr_accessor :payment

  def initialize(payment)
    @payment = payment
  end

  def get_link
    ("https://test2pay.ghl.com/IPGSG/Payment.aspx?" + "&TransactionType=SALE" + "&PymtMethod=" + 
     payment.payment_method + "&ServiceID=sit" + "&PaymentID=" + payment.payment_transaction_id + "&OrderNumber=" + 
     payment.package_id + "&PaymentDesc=" + payment.package_description + "&MerchantReturnURL=" + "http://0.0.0.0:3000/success" + 
     "&Amount=" + payment.package_price + "&CurrencyCode=MYR" + "&HashValue=" + hash_value + "&CustIP" +
     payment.ip_address + "&CustName=" + payment.user_name + "&CustEmail=" + payment.user_email + 
     "&CustPhone=" + payment.user_phone_no + "&MerchantName=MOD" + "&MerchantCallBackURL=" + "http://0.0.0.0:3000/success" +
     "&PageTimeout=780")
  end

  private

  def hash_value
    message = "password" + "sit" + payment.payment_transaction_id + "http://0.0.0.0:3000/success" + payment.package_price + "MYR" + payment.ip_address + "780"

    Digest::SHA256.hexdigest(message)
  end
end
