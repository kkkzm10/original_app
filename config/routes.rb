Rails.application.routes.draw do

  get 'messages/index'
  devise_for :users
  root to: 'top#index'
  resources :messages, only: [:index]
  resources :users, only: [:edit, :update]

end
