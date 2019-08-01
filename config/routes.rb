Rails.application.routes.draw do
  resources :artists, only: [:index,:show]
  resources :directors, only: [:index, :show]
  resources :genres, only: [:index, :show]
  resources :videos, only: [:index, :show]
  resources :reviews, except: [:index]
  resources :users, except: [:index]
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
