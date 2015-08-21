class Users::VerificationCode
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def deliver
    message = "RM0.00: mod.com.my • Hi, thanks for signing up with MOD! This is your 6-digit verification code: #{verification_code}"
    number = "+60" + user.phone_number
    TwilioSMS.new(message, number).send
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
