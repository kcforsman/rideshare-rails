Rails.application.routes.draw do

  get '/passengers', to: "passengers#index", as: "passengers"
  get '/passengers/new', to: "passengers#new", as: "new_passenger"
  post '/passengers', to: "passengers#create"
  get '/passengers/:id/edit',  to: "passengers#edit", as: "edit_passenger"

  get '/passengers/:id', to: "passenger#show", as:"passenger"

  patch '/passengers/:id', to: "passenger#update"
  delete '/passengers/:id', to: "passenger#destroy"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
