Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :tickets, only: [:index, :show, :create, :edit, :new] do
     resources :comments, only: [:create, :destroy]
     member do
      post :favorite
      post :unfavorite
     end
  end
resources :searches
root "tickets#index"


  namespace :admin do
    resources :tickets
    resources :users
    root "tickets#index"
  end



end
