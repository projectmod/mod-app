class MakePayment
  attr_accessor :params

  def intiailize
    @params = params
    #{ TransactionType: 'SALE', 
    # PymtMethod: 'CC', ServiceID: 'sit', 
    # PaymentID: '1151', OrderNumber: '1234', 
    # PaymentDesc: 'KeanSeng', MerchantReturnURL: 'http://google.com', 
    # Amount: '120.00', CurrencyCode: 'MYR', HashValue: 'ad1cf3a0b64d301b106796c122d8c7d302e26827e69dae30fe3688cfdb29d2a5',
    #  CustIP: '127.0.0.1', CustName: 'Lim', CustEmail: 'eldrethlim@gmail.com', CustPhone: 7552525, MerchantName: 'MOD',
    #   CustMAC: '1231', LanguageCode: 'EN', PageTimeout: '900', IssuingBank: 'Maybank', BillAddr: '99, ss99/99' }
  end

  def pay
    uri = URI.parse('https://test2pay.ghl.com/IPGSG/Payment.aspx')

    response = Net::HTTP.post_form(uri, params)
  end
end

x = { TransactionType: 'SALE', 
  PymtMethod: 'CC', ServiceID: 'sit', 
  PaymentID: '1151', OrderNumber: '1234', 
  PaymentDesc: 'KeanSeng', MerchantReturnURL: 'http://google.com', 
  Amount: '120.00', CurrencyCode: 'MYR', HashValue: 'ad1cf3a0b64d301b106796c122d8c7d302e26827e69dae30fe3688cfdb29d2a5',
   CustIP: '127.0.0.1', CustName: 'Lim', CustEmail: 'eldrethlim@gmail.com', CustPhone: 7552525, MerchantName: 'MOD',
    CustMAC: '1231', LanguageCode: 'EN', PageTimeout: '900', IssuingBank: 'Maybank', BillAddr: '99, ss99/99' }

link_to 'https://test2pay.ghl.com/IPGSG/Payment.aspx?' + 'TransactionType=${TransactionType}'