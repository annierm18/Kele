class Kele
    include HTTParty
    require "kele/version"

    def initialize(email, password)
        @options = {query: {email: email, password: password}}
        response = self.class.post("https://www.bloc.io/api/v1/sessions", @options)
        @auth_token = response["auth_token"]
    end


#  module Kele
    # Your code goes here...
#  end

end
