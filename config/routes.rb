Rails.application.routes.draw do

  root 'homepage#index'
  resources :homepage, only: [:index]

# routes for drivers
  resources :drivers do
    resources :trips, only: [:show, :destroy]
  end

# routes for passengers
  resources :passengers do
    resources :trips, only: [:show, :destroy, :create, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
