Rails.application.routes.draw do

#routes for trips
get '/trips', to: "trips#index", as: "trips"
get '/trips/new', to: "trips#new", as: "new_trip"
post '/trips', to: "trips#create"
get '/trips/:id/edit',  to: "trips#edit", as: "edit_trip"

get '/trips/:id', to: "trips#show", as:"trip"

patch '/trips/:id', to: "trips#update"
delete '/trips/:id', to: "trips#destroy"


# routes for drivers
  get '/drivers', to: "drivers#index", as: "drivers"
  get '/drivers/new', to: "drivers#new", as: "new_driver"
  post '/drivers', to: "drivers#create"
  get '/drivers/:id/edit',  to: "drivers#edit", as: "edit_driver"

  get '/drivers/:id', to: "drivers#show", as:"driver"

  patch '/drivers/:id', to: "drivers#update"
  delete '/drivers/:id', to: "drivers#destroy"

# routes for passengers
  get '/passengers', to: "passengers#index", as: "passengers"
  get '/passengers/new', to: "passengers#new", as: "new_passenger"
  post '/passengers', to: "passengers#create"
  get '/passengers/:id/edit',  to: "passengers#edit", as: "edit_passenger"

  get '/passengers/:id', to: "passengers#show", as:"passenger"

  patch '/passengers/:id', to: "passengers#update"
  delete '/passengers/:id', to: "passengers#destroy"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
