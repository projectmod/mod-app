class Users::Profile::Facebook
  attr_accessor :access_token

  def initialize(access_token)
    @access_token = access_token
  end

  def retrieve
    graph = Koala::Facebook::API.new(access_token)

    profile = graph.get_object("me?fields=name,id,email")
    
    OpenStruct.new(name: profile["name"], email: profile["email"], uid: profile["id"])
  end
end
