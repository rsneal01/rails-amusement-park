Rails.application.routes.draw do
  root 'application#index'
  # get '/users/new' => 'users#new'
  # post '/users', to:'users#create'

  # post '/user/new' => 'users#create'
  resources :users, only: [:new, :create, :show]
  # post '/users/:id', to: 'users#show', as: 'user'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'
  get '/attractions' => 'attractions#index'
  get '/attractions/:id', to: 'attractions#show', as: 'attraction'
  post '/users/:id/edit', to: 'users#update', as: 'users_update'

  # resources :attractions, only: [:new, :create, :show]
  # get '/users/:id', to: 'users#show', as: 'user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
