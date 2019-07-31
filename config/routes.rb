Rails.application.routes.draw do
  resources :artists
  resources :directors
  resources :genres
  resources :videos
  resources :reviews
  resources :users
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
