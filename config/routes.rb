Rails.application.routes.draw do

  root 'posts#index'
  devise_for :users
  get 'products/index'

  resources :posts do
    # member do
    #   post :call
    # end
        resources :details
        
    collection do
      post :import
      get :message
    end
  end
  
  resources :sfas do 
        resources :comments
        
    collection do
      post :import
      get :message
    end
  end

  


  get 'call/token'
  post'call/voice'
  # resources :call, only:[:index] do
  #   collection do
  #     get :voice
  #   end
  # end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
