Rails.application.routes.draw do
  resources :players, only: %i[create update show index destroy]
  resources :games, only: %i[index show create]
  resources :matches, only: %i[create destroy show index]
  resources :users, only: %i[create update index]

  post '/signup', to: 'users#create'

  get '/me', to: 'users#show'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
end
