Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root 'book#input'
  match 'book/output', via: %I[get post]
  get 'book/data'
  get '/signin', to: 'sessions#new'
  get '/signup', to: 'users#new'
end
