Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors, only: %i(show)
  resources :doctor_patients, only: %i(destroy)
  resources :patients, only: %i(index)
  resources :hospitals, only: %i(show)
end
