require 'google/apis/plus_v1'
require 'signet/oauth_2/client'

class GoogleAuthenticator
  def self.client(code)
    Signet::OAuth2::Client.new(client_params).tap do |client|
      client.code = code
      client.fetch_access_token!
    end
  end

  def self.client_params
    { authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      token_credential_uri: 'https://www.googleapis.com/oauth2/v3/token',
      client_id: ENV['GOOGLE_CLIENT_ID'],
      client_secret: ENV['GOOGLE_CLIENT_SECRET'],
      scope: 'email profile',
      redirect_uri: ENV['GOOGLE_REDIRECT_URI'] }
  end

  def self.user_info(code)
    Google::Apis::PlusV1::PlusService.new.tap do |user_info|
      user_info.key = ENV['GOOGLE_CLIENT_ID'] if ENV['GOOGLE_CLIENT_ID']
      user_info.authorization = client(code)
    end
  end

  def self.payload(user)
    { access_token: JsonWebTokenService.encode(user_id: user.id), user: user }
  end
end
