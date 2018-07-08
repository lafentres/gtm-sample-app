Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users', to: 'users#index'
  delete '/users/:id/destroy', to: 'users#destroy', as: :destroy_user
  get '/users/:id', to: 'users#show', as: :user
  get '/users/:id/edit', to: 'users#edit', as: :edit_user
  patch '/users/:id', to: 'users#update', as: :update_user

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/user_activation/:token/edit', to: 'user_activations#edit', as: :edit_user_activation

  get '/password_resets/new', to: 'password_resets#new', as: :new_password_reset
  post '/password_resets', to: 'password_resets#create', as: :password_resets
  get '/password_resets/:token/edit', to: 'password_resets#edit', as: :edit_password_reset
  patch '/password_resets/:token', to: 'password_resets#update', as: :password_reset

  get '/posts/new', to: 'posts#new', as: :new_post
  post '/posts/new', to: 'posts#create'
  delete '/posts/:id/destroy', to: 'posts#destroy', as: :destroy_post
  get '/posts/:id', to: 'posts#show', as: :post
  get '/posts/:id/edit', to: 'posts#edit', as: :edit_post
  patch '/posts/:id', to: 'posts#update', as: :update_post

  post '/posts/:id/like', to: 'likes#create', as: :like
  delete '/posts/:id/unlike', to: 'likes#destroy', as: :unlike

  root "home#index"
end
