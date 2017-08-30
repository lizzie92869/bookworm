Rails.application.routes.draw do


root 'application#index'
resources :users 


# books

 get '/books', to: 'books#index'
 get '/books/new', to: 'books#new'
 get '/books/:id', to: 'books#show'
 get '/books/:id/edit', to: 'books#edit'
 patch '/books/:id', to: 'books#update'
 put '/books/:id', to: 'books#update'
 delete '/books/:id', to: 'books#destroy'
 post '/books', to: 'books#create'

# users

 # get '/users/new', to: 'users#new'
 # post '/users', to: 'users#create'

 get '/signup', to: 'users#new'
 post '/signup', to: 'users#create'
 get '/forgot', to: 'users#forgot'
# sessions

get '/signin', to: 'sessions#new'
get '/sessions/new', to: 'sessions#new' 
post '/signin', to: 'sessions#create'
post '/sessions', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'







end