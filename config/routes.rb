Rails.application.routes.draw do

# routes for drivers
  get '/drivers', to: "drivers#index", as: "drivers"
  get '/drivers/new', to: "drivers#new", as: "new_driver"
  post '/drivers', to: "drivers#create"
  get '/drivers/:id/edit',  to: "drivers#edit", as: "edit_driver"

  get '/drivers/:id', to: "driver#show", as:"driver"

  patch '/drivers/:id', to: "driver#update"
  delete '/drivers/:id', to: "driver#destroy"

# routes for passengers
  get '/passengers', to: "passengers#index", as: "passengers"
  get '/passengers/new', to: "passengers#new", as: "new_passenger"
  post '/passengers', to: "passengers#create"
  get '/passengers/:id/edit',  to: "passengers#edit", as: "edit_passenger"

  get '/passengers/:id', to: "passenger#show", as:"passenger"

  patch '/passengers/:id', to: "passenger#update"
  delete '/passengers/:id', to: "passenger#destroy"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
