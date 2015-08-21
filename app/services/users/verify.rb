class Users::Verify
  attr_accessor :code, :user

  def initialize(code, user)
    @code = code
    @user = user
  end

  def check
    return user.activate if user.verification_code == code

    false
  end
end
