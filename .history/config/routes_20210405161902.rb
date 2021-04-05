Rails.application.routes.draw do
  resources :users do
    resources :genres
    resources :games
  end
  resources :sessions, only: [:create, :new, :destroy]
  root 'sessions#new'
  get '/signup', to: 'users#new'
  post '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end