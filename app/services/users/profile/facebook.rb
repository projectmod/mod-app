module Users
  module Profile
    class Facebook
      attr_accessor :access_token

      def initialize(access_token)
        @access_token = access_token
      end

      def retrieve
        graph = Koala::Facebook::API.new(access_token)

        profile = graph.get_object("me", {}, api_version: "v2.3")
        image = graph.get_picture("me", {type: "large"})

        OpenStruct.new(name: profile["name"], email: profile["email"], uid: profile["id"], avatar: image)

      end
    end
  end
end
