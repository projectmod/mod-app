module Users
  class Oauth
    attr_accessor :access_token, :provider, :user

    def initialize(access_token, provider, user)
      @access_token = access_token.token
      @provider = provider
      @user = user
    end

    def register
      new_user = User.create(name: profile.name, email: profile.email, remote_avatar_url: profile.avatar)
      new_user.authentications.build(provider: provider, uid: profile.uid, token: access_token).save

      new_user
    end

    private

    def profile
      Users::Profile::Facebook.new(access_token).retrieve
    end
  end
end
