Rails.application.routes.draw do
  devise_for :users
  
  root to: "organisations#index"
  resources :organisations, except: [ :new ] do
    
  end

  
end
