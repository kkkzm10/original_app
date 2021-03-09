Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  resources :mates, only:[:index, :show]
  resources :messages, only: [:index]
  resources :users, only: [:index, :show, :edit, :update]
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end  
end
