Rails.application.routes.draw do
  devise_for :users
  get 'reservations/index'
  get 'reservations/show'
  get 'reservations/update'
  get 'reservations/delete'
  get 'doctors/index'
  get 'doctors/show'
  get 'doctors/update'
  get 'doctors/delete'
  get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
