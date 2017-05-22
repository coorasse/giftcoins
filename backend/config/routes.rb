Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'token', to: 'google_auth#create'
      resources :groups, only: [:index]
    end
  end
  root to: 'home#index'
end
