Rails.application.routes.draw do


root 'application#index'
get '/signup' => 'users#new'
post '/signup' => 'users#create'
post '/user' => 'users#create'
post '/session' => 'sessions#create'
get 'sessions/new'

end