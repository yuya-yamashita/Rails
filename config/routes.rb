Rails.application.routes.draw do


  get 'comments/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'favorites/index'

  get 'topics/new'
  get 'comments/new'
  post 'comments/new'
  get 'sessions/new'

  root 'pages#index'
  get 'pages/help'

  #root 'topics#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources 'users'
  resources 'topics'
  resources 'comments'

  post '/favorites', to: 'favorites#create'
  get '/favorites', to: 'favorites#index'

  post '/comments', to: 'comments#create'
end
