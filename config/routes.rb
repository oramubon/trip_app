Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get  'areas', to: 'users/registrations#new_area'
    post 'areas', to: 'users/registrations#create_area'
    get  'images', to: 'users/registrations#new_image'
    post 'images', to: 'users/registrations#create_image'
    
  end
  root to: 'tweets#index'
  resources :users,  only: :show
  resources :tweets, only: [:new, :create]
end
