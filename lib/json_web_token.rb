class JsonWebToken
  def self.verify(token)
  	JWT.decode(token, ENV["SECRET_OAUTH_KEY"],
    true,
    algorithm: 'HS512',
    verify_iss: true)
  end
end