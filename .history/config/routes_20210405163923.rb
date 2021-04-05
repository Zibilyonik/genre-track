Rails.application.routes.draw do
  resources :genres, only: [:index]
  resources :games, only: [:index]
  resources :users do
    resources :genres
    resources :games
  end
  resources :sessions, only: [:create, :new, :destroy]
  root 'users#new'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/games', to: 'games#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
