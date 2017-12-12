# class GetToken
#   def self.from_credentials(client_id, service_uri, email, password)
#   	request_params = {
# 	  :client_id => client_id,
# 	  :grant_type => 'password',
# 	  :email => email,
# 	  :password => password
# 	}
# 	uri = URI.parse(service_uri)
# 	http = Net::HTTP.new(uri.host, uri.port)
# 	request = Net::HTTP::Post.new(uri + "/oauth/token")
# 	request.body = request_params.to_query
# 	@response = http.request(request)
#   	JSON.parse(@response.body)
#   end
# end