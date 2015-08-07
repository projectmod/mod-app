class Users::VerificationCode
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def verification_code
    user.update(verification_code: generate_random_code)

    user.verification_code
  end

  def deliver
    message = "Hi! This is your 6 digit verification code: #{verification_code}"
    client = Twilio::REST::Client.new
    client.messages.create(
      from: '+18885809742',
      to: "+60" + user.phone_no,
      body: message.html_safe
    )
  end

  private

  def generate_random_code
    code = loop do
      number = rand(10**6)
      break number if number.to_s.length == 6
    end
  end
end
