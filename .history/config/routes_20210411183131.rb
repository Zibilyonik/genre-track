Rails.application.routes.draw do
  resources :users do
    resources :genres
    resources :games
  end
  resources :sessions, only: [:create, :new, :destroy]
  root 'sessions#new'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/games', to: 'games#create'
  post '/genres', to: 'genres#create'
  put '/games', to: 'games#edit'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
