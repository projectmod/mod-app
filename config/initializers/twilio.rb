account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTHTOKEN']

Twilio.configure do |config|
  config.account_sid = account_sid
  config.auth_token = auth_token
end
