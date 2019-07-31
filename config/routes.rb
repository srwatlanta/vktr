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
<<<<<<< HEAD
  root 'videos#index' 
=======
  root "home#index"
>>>>>>> 8671cc3afdd7735e6062ba74fe811649ea826e69
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
