module Api
  module V1
    class GroupsController < AuthenticatedController
      def index
        render json: [{ name: 'hello' }, { name: 'world' }], status: :ok
      end
    end
  end
end
