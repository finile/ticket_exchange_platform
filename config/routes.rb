Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tickets#index"

  resources :tickets, only: [:index, :show, :create, :edit, :new, :update] do
     resources :comments, only: [:create, :destroy]
     member do
      post :favorite
      post :unfavorite
     end
  end

  resources :railtickets, only: [:index, :show, :create, :edit, :new, :update] do
     resources :comments, only: [:create, :destroy]
     member do
      post :favorite
      post :unfavorite
     end
  end

  resources :users, only: [:index, :show, :edit, :update, :destroy] do
          member do
            get :tickets
            get :railtickets
            get :favorites
            get :comments

          end
        end


  resources :favorites, only: [:create, :destroy]
  resources :searches

  namespace :admin do
    resources :tickets
    resources :users
    resources :railtickets
    root "tickets#index"
  end


  resources :coupons, only: [:index, :show, :create, :edit, :new, :update]


  resources :searches

end
