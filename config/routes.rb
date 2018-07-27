Rails.application.routes.draw do

  devise_for :users
  get 'products/index'

  resources :posts do 
    collection { post :import}
    end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
