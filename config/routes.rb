Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount_devise_token_auth_for 'User', at: 'auth'

  root to: redirect('/api-docs')

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :consoles, only: [:index, :create, :destroy, :show]
      resources :reservations, only: [:create, :index, :destroy]
    end
  end
end
