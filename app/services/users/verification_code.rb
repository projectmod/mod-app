class Users::VerificationCode
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def deliver
    message = "Hi! This is your 6 digit verification code: #{verification_code}"
    number = "+60" + user.phone_no
    TwillioSMS.new(message, number).send
  end

  private

  def verification_code
    user.update(verification_code: generate_random_code)
    user.verification_code
  end

  def generate_random_code
    code = loop do
      number = rand(10**6)
      break number if number.to_s.length == 6
    end
  end
end
