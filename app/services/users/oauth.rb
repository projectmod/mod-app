module Users
  class Oauth
    attr_accessor :access_token, :provider, :user

    def initialize(access_token, provider, user)
      @access_token = access_token.token
      @provider = provider
      @user = user
    end

    def register
      profile = Users::Profile::Facebook.new(access_token).retrieve

      user.update(name: profile.name, email: profile.email, remote_avatar_url: profile.avatar)
      user.authentications.build(provider: provider, uid: profile.uid, token: access_token).save

      user
    end
  end
end
