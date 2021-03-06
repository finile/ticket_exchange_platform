Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  # ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "articles#index"


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
        # post :add_to_cart
        # post :remove_from_cart
      end
  end


  resources :railtickets, only: [:index, :show, :create, :edit, :new, :update, :destroy] do
   resources :comments, only: [:create, :destroy]
    member do
      post :favorite
      post :unfavorite
      # post :add_to_rail_cart
      # post :remove_from_rail_cart
    end
  end

  resources :metros, only: [:index, :show, :create, :edit, :new, :update, :destroy] do
   resources :comments, only: [:create, :destroy]
    member do
      post :favorite
      post :unfavorite
      
    end
  end

  resources :parktickets, only: [:index, :show, :create, :edit, :new, :update, :destroy] do
   resources :comments, only: [:create, :destroy]
    member do
      post :favorite
      post :unfavorite
    end
  end

  resources :metros, only: [:index, :show, :create, :edit, :new, :update, :destroy] do
   resources :comments, only: [:create, :destroy]
    member do
      post :favorite
      post :unfavorite
    end
  end

  resources :comboards, only: [:index, :show, :create, :edit, :new, :update, :destroy] do
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
      get :comboards
      get :metros
      get :parktickets
    end
  end

  resources :articles do
    collection do
      get :visa
      get :direct_flight
      get :lagage
      get :carry
      get :price
      get :checkin
    end
  end

  namespace :admin do
    resources :users
    resources :tickets
    resources :railtickets
    resources :coupons
    resources :comboards
    # resources :orders
    # resources :rail_orders
    resources :parktickets
    resources :metros
    root "tickets#index"
  end

  resources :searches

  # resource :cart
  # resources :orders do
  #   post :checkout_spgateway, on: :member
  # end
  #
  # resource :rail_cart
  # resources :rail_orders do
  #   post :checkout_spgateway1, on: :member
  # end

end
