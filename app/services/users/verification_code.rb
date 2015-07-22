class VerificationCode
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def verification_code
    user.update(verification_code: rand(10 ** 6))

    user.verification_code
  end

  def deliver
    message = "Hi! This is your 6 digit verification code: #{verification_code}"
    client = Twillio::REST::Client.new
    client.messages.create(
      from: '+18885809742',
      to: user.phone_no,
      body: message.html_safe
    )
  end
end
