require "kele/version"

class Kele
  include HTTParty

  def initialize(email, password)
    @base_url = 'https://www.bloc.io/api/v1'
    @options = {query: {email: email, password: password}}
    response = self.class.post("#{@base_url}/sessions", @options)
    @auth_token = response["auth_token"]
  end

  def get_me
    response = self.class.get("#{@base_url}/users/me", headers: {"authorization" => @auth_token})
    JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get("#{@base_url}/mentors/#{mentor_id}/student_availability", headers: {"authorization" => @auth_token})
    JSON.parse(response.body)
  end
end
