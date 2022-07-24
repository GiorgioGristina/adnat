Rails.application.routes.draw do
  devise_for :users
  
  root to: "organisations#index"
  resources :organisations, except: [ :new ] do
    resources :employments, only: [ :create ]
  end
  
  resources :employments, only: [ :destroy ]

  
end
