# frozen_string_literal: true

Rails.application.routes.draw do
  resources :books
  resources :users
  resources :sessions, only: %i[new create destroy]
  root 'books#new'
  put '/books/:id/like', to: 'books#like'
  put '/books/:id/unlike', to: 'books#unlike'
  get '/signin', to: 'sessions#new'
  get '/signup', to: 'users#new'

  scope '(:locale)', locale: /en|ru/ do
    resources :books, :users
  end
end
