class TwilioSMS
  attr_accessor :message, :number

  def initialize(message, number)
    @message = message
    @number = number
  end

  def send
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTHTOKEN'])
    @client.messages.create(
      from: '+18885809742',
      to: number,
      body: message.html_safe
    )
  end
end
