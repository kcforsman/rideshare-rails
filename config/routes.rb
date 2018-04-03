Rails.application.routes.draw do

#routes for trips
  delete '/trips/:id', to: "trips#destroy"

  resources :trips, except: [:index]

# routes for drivers
  delete '/drivers/:id', to: "drivers#destroy"

  resources :drivers

# routes for passengers
  delete '/passengers/:id', to: "passengers#destroy"

  resources :passengers
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
