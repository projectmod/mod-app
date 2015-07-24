class Users::Check
  attr_accessor :phone_no

  def initialize(phone_no)
    @phone_no = phone_no.to_s
  end

  def exist
    user = User.find_by(phone_no: phone_no)

    if user
      user
    else
      User.new(phone_no: phone_no)
    end
  end
end
