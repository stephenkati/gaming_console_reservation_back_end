Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    devise_for :users, controllers: {
      registrations: 'api/users/registrations',
      sessions: 'api/users/sessions'
    }

    resources :reservations, only: [:create, :index, :destroy]
  end
end
