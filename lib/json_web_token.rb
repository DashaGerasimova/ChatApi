class JsonWebToken
  def self.verify(token)
    JWT.decode(token, nil,
	  true, # Verify the signature of this token
	  algorithm: 'RS256',
	  iss: 'http://localhost:3001/',
	  verify_iss: true,
	  aud: '2bfc86fcc644e64bea842a971fa6d19ea1c837de018cadffa711866fed6d47e1',
	  verify_aud: true) do |header|
        jwks_hash[header['kid']]
      end
  end

  def self.jwks_hash
    jwks_raw = Net::HTTP.get URI("#{Rails.application.secrets.auth0_domain}.well-known/jwks.json")
    jwks_keys = Array(JSON.parse(jwks_raw)['keys'])
    Hash[
      jwks_keys
      .map do |k|
        [
          k['kid'],
          OpenSSL::X509::Certificate.new(
            Base64.decode64(k['x5c'].first)
          ).public_key
        ]
      end
    ]
  end

  def self.encode(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(token, Rails.application.secrets.secret_key_base)[0])
  rescue
    nil
  end
end