Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :stores
  resources :comments #, only: [:create, :update, :destroy]
  resources :events do
  resources :appointments
  resources :products
  resources :product_appointments
  resources :product_events
  end
end