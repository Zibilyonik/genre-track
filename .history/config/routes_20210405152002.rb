Rails.application.routes.draw do
  resources :genres
  resources :games
  resources :users do
    resources :genres
    resources :games
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
