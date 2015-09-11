class TwilioSMS
  attr_accessor :message, :number

  def initialize(message, number)
    @message = message
    @number = number
  end

  def send
    @client = Twilio::REST::Client.new
    @client.messages.create(
      from: '+12766644132',
      to: number,
      body: message.html_safe
    )
  end
end
