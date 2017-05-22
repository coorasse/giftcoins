class ApplicationController < ActionController::API
  attr_reader :current_user

  def authenticate_request!
    if valid_token?
      @current_user = User.find(auth_token[:user_id])
    else
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  private

  def valid_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end

  def http_token
    @http_token ||= if request.headers['Authorization'].present?
                      request.headers['Authorization'].split(' ').last
                    end
  end

  def auth_token
    @auth_token ||= JsonWebTokenService.decode(http_token)
  end
end
