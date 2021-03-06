Rails.application.routes.draw do
  root 'home#index'
  
  namespace :admin do
    resources :users  
    resources :events
    resources :appointments
    resources :feedbacks
    resources :stores
    resources :blogs

    resources :calendar do
      collection do
        get 'show', to: 'calendar#show', as: :data
        get 'update', to: 'calendar#update', as: :db_action
      end
    end
    resources :products
    resources :store_products
    resources :event_types
    resources :units
    root 'admin#index'
  end
  
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :stores do
    resources :store_product
  end

  resources :comments
  resources :product

  resources :blogs do
    resources :likes
  end
  resources :blog_comments
  
  resources :events do
    resources :appointments
    resources :feedbacks
  end
  
  resources :users, only: [:show, :update]

  get 'story', to: 'home#story'
  get 'community', to: 'home#community'

end