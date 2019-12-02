Rails.application.routes.draw do
  resources :powers
  resources :heroines

  root to: 'heroines#index'
  get '/search', to: 'heroines#search'
end
