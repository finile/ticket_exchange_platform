Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


 resources :tickets, only: [:index, :show, :create, :edit, :new]
 root "tickets#index"

  namespace :admin do 
  resources :tickets
  root "tickets#index"
end

end
