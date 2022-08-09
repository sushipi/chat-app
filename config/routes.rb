Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  root to: "rooms#index"
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end  
end
