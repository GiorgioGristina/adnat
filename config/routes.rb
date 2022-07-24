Rails.application.routes.draw do
  devise_for :users
  
  root to: "organisations#index"
  resources :organisations, except: [ :new , :destroy] do
    resources :employments, only: [ :create ]
    resources :shifts, only: [ :create ]
  end
  
  resources :employments, only: [ :destroy ]
  resources :shifts, only: [:edit, :update, :destroy ]
  
end
