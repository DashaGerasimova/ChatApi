class JsonWebToken
  def self.verify(token)
  	
  end

  private

  def decode(token)
    JWT.decode(token, "kittens",
	  true, # Verify the signature of this token
	  algorithm: 'HS512',
	  verify_iss: true)
  rescue
    nil
  end
end