Rails.application.routes.draw do
  root 'application#index'
  # users
  get '/user_profile/:id', to: 'users#show', as: 'user_profile'
  resources :users do
    member do
      get :confirm_email
    end
  end

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  put '/users/forgot', to: 'users#update'

  # sessions
  get '/signin', to: 'sessions#new'
  get '/sessions/new', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/sessions', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  patch '/signin', to: 'sessions#new'

  # Omniauth
  get '/auth/:provider/callback', to: 'sessions#create'

  # password_resets
  resources :password_resets

  # books
  # has to be outside books block, was not routing properly
  get '/books/search', to: 'books#search', as: 'book_search'
  resources :books do
    resources :chapters
  end
end
