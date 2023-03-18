Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :players
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
  delete '/logout', to: 'sessions#destroy', as: :logout
  get '/games/join', to: 'games#join', as: :join_game
  get '/waiting_rooms/new', to: 'waiting_rooms#new', as: :new_waiting_room
  get '/login', to: 'sessions#new', as: :login_new
  get '/register', to: 'users#new', as: :register
end
