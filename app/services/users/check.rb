class Users::Check
  attr_accessor :phone_number

  def initialize(phone_number)
    @phone_number = phone_number.to_s
  end

  def exist
    return user if user = User.find_by(phone_number: phone_number)
    User.new(phone_number: phone_number)
  end
end
