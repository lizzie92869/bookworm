Rails.application.routes.draw do


root 'application#index'
get '/signup' => 'users#new'
post '/signup' => 'users#create'
post '/user' => 'users#create'
post '/session' => 'sessions#create'
get 'sessions/new'

books

 get '/books', to: 'books#index'
 get '/books/new', to: 'books#new'
 get '/books/:id', to: 'books#show'
 get '/books/:id/edit', to: 'books#edit'
 patch '/books/:id', to: 'books#update'
 put '/books/:id', to: 'books#update'
 delete '/books/:id', to: 'books#destroy'
 post '/books', to: 'books#create'

 users


 /users
 get '/users/new', to: 'users#new' => show signup  form
 post '/users', to: 'users#create'

 get '/signup', to: 'users#new'
 post '/signup', to: 'users#create'

 session, we control login process
http://site.com/<whatto type here>
get '/signin', to: 'sessions#new'
post '/signin', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'





end