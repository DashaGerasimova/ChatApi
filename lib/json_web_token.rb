class JsonWebToken
  def self.decode(token)
  	JWT.decode(token, ENV["SECRET_OAUTH_KEY"],
    true,
    algorithm: 'HS512',
    verify_iss: true)
  rescue
  	nil
  end
end