Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: 'top#index'
  resources :mates, only:[:index, :show]
  resources :messages, only: [:index]
  resources :users, only: [:index, :show, :edit, :update]
  resources :relationships, only: [:create]
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end  
end
