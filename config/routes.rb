Rails.application.routes.draw do
  resources :transactions
  resources :cart_items do
    member do
      delete 'remove'
      post 'add_food_to_cart'
      delete 'remove_food_from_cart'
    end
  end
  resources :food_items
  resources :users

  resources :restaurents 
  get '/ping', to: 'restaurents#ping'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
