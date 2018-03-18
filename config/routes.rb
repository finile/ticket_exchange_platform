Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :tickets, only: [:index, :show, :create, :edit, :new, :update]
  root "tickets#index"

  namespace :admin do 
    resources :tickets
    root "tickets#index"
  end


  resources :coupons, only: [:index, :show, :create, :edit, :new, :update]


  resources :searches

end
