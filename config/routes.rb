Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }


  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tickets#index"

  resources :tickets, only: [:index, :show, :create, :edit, :new, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
     member do
      post :favorite
      post :unfavorite
     end
  end

  resources :coupons, only: [:index, :show, :create, :edit, :new, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
      member do
        post :favorite
        post :unfavorite
      end
  end


  resources :railtickets, only: [:index, :show, :create, :edit, :new, :update, :destroy] do
   resources :comments, only: [:create, :destroy]
    member do
      post :favorite
      post :unfavorite
   end
  end

  resources :boards, only: [:index, :show, :create, :edit, :new, :update] do
   resources :comments, only: [:create, :destroy]

  end

  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    member do
      get :tickets
      get :railtickets
      get :favorites
      get :unfavorites
      get :comments
      get :coupons
      get :boards
    end
  end

  resources :searches

  namespace :admin do
    resources :users
    resources :tickets
    resources :railtickets
    resources :coupons
    resources :boards
    root "tickets#index"
  end

end
