class Users::Check
  attr_accessor :phone_no

  def initialize(phone_no)
    @phone_no = phone_no
  end

  def exist
    return user if user = User.find_by(phone_no: phone_no)

    User.new(phone_no: phone_no)
  end
end
