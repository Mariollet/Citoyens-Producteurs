Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :stores
  resources :comments #, only: [:create, :update, :destroy]

  resources :product
  resources :events do
    resources :appointments
    resources :feedbacks
  end
  resources :users, only: [:show]
end