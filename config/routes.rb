Rails.application.routes.draw do

  #has to be outside books block, was not routing properly
  get '/books/search', to: 'books#search', as: 'book_search'
  resources :books do
    resources :chapters
  end
end
