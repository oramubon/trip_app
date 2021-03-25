Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get  'areas', to: 'users/registrations#new_area'
    post 'areas', to: 'users/registrations#create_area'
  end
  root to: 'tweets#index'
  resources :users, only: :show
end
