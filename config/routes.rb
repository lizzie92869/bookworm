Rails.application.routes.draw do


root 'application#index'
get '/users/forgot', to: 'users#forgot'
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


 # get '/users/update', to: 'users#update'
 put '/users/forgot', to: 'users#update'
 

# sessions

get '/signin', to: 'sessions#new'
get '/sessions/new', to: 'sessions#new' 
post '/signin', to: 'sessions#create'
post '/sessions', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'







end