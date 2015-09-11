class Users::Oauth
  attr_accessor :access_token, :provider, :user

  def initialize(access_token, provider, user)
    @access_token = access_token.token
    @provider = provider
    @user = user
  end

  def register
    binding.pry
    new_user = User.create(name: profile.name, email: profile.email, role: "user")
    new_user.authentications.create(provider: provider, uid: profile.uid, token: access_token)

    new_user
  end

  private

  def profile
    Users::Profile::Facebook.new(access_token).retrieve
  end
end
