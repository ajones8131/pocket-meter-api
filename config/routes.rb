# config/routes.rb

Rails.application.routes.draw do
  resources :users,    only: [:index, :show, :create, :update, :destroy]
  resources :comments, only: [:index, :show, :create, :update, :destroy]
end
