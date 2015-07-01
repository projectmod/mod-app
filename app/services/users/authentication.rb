module Users
  class Authentication
    attr_accessor :access_token, :provider

    def initialize(access_token, provider)
      @access_token = access_token.token
      @provider = provider
    end

    def register
      profile = Users::Profile::Facebook.new(access_token).retrieve

      new_user = User.create(name: profile.name, email: profile.email)
      new_user.authentications.build(provider: provider, uid: profile.uid, token: access_token).save

      new_user
    end
  end
end
