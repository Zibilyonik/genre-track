# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users do
    resources :games, except: 'external'
  end
  resources :genres
  resources :games, only: 'external'
  resources :sessions, only: %i[create new destroy]
  root 'sessions#new'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/games', to: 'games#create'
  post '/genres', to: 'genres#create'
  get 'user/:id/external', to: 'games#external'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
