require 'signet/errors'

module Api
  module V1
    class GoogleAuthController < ApplicationController
      before_action :require_code
      before_action :load_user
      rescue_from Signet::AuthorizationError, with: :forbidden

      def create
        render json: GoogleAuthenticator.payload(@user), status: :ok
      end

      private

      def require_code
        forbidden(Exception.new('No code present in the request')) unless params[:code]
      end

      def load_user
        info = GoogleAuthenticator.user_info(params[:code]).get_person('me')
        @user = User.from_google(info)
      end

      def forbidden(exception)
        Rails.logger.error exception.message
        head :forbidden
      end
    end
  end
end
