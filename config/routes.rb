Rails.application.routes.draw do
  get '/doctor', to:'doctors#index'
  get '/doctor/details', to: 'doctors#show'
  
  get 'reservations', to: 'reservations#index'
  get '/users', to: 'users#index'



end
