Rails.application.routes.draw do
  resources :books
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root 'books#new'
  match 'books/output', via: %I[get post]
  get 'books/data'
  get '/signin', to: 'sessions#new'
  get '/signup', to: 'users#new'
end
