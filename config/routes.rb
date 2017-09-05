Rails.application.routes.draw do

root 'application#index'

    # users
    resources :users 
    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'
    put '/users/forgot', to: 'users#update'
    get '/users/forgot', to: 'users#forgot' 

    # sessions

    get '/signin', to: 'sessions#new'
    get '/sessions/new', to: 'sessions#new' 
    post '/signin', to: 'sessions#create'
    post '/sessions', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    # books
    #has to be outside books block, was not routing properly
    get '/books/search', to: 'books#search', as: 'book_search'
    resources :books do
       resources :chapters
    end

end

