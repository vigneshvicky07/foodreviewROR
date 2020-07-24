Rails.application.routes.draw do

namespace :api do
  # resources :food
  post '/create' => 'food#create'
  post '/getfood' => 'food#getfood'
  post '/create/review'=> 'review#create'
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
