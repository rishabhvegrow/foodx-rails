module JwtTokenHelper
    def self.generate_token(user_id)
      jwt_secret_key = Rails.application.credentials.jwt_secret_key # Use your secret key
  
      token_claims = {
        user_id: user_id,
        exp: (Time.now + 24.hours).to_i # Set token expiration time (24 hours in this case)
      }
  
      JWT.encode(token_claims, jwt_secret_key, 'HS256')
    end
  end
  