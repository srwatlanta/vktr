Rails.application.routes.draw do
  resources :artists
  resources :directors
  resources :genres
  resources :videos
  resources :reviews
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
