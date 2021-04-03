Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get  'areas', to: 'users/registrations#new_area'
    post 'areas', to: 'users/registrations#create_area'
    get  'images', to: 'users/registrations#new_image'
    post 'images', to: 'users/registrations#create_image'
    
  end
  resources :users,  only: [:show, :index] do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :tweets
  resources :tours, only: [:index, :new, :create, :show, :edit, :update]
end
