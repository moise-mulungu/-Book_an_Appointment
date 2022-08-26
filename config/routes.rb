Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do

    resources :users, only: [:index, :create] do
      resources :doctors, only: [:index, :show, :create, :destroy]
      resources :reservations, only: [:index, :create]

    end
  end

  get 'login', to: 'v1/users#authenticate'
  #  List of all doctors
  get 'v1/doctors', to: 'v1/doctors#doctors_list'

end
