Rails.application.routes.draw do
  
  devise_for :admins
  resources :patients ,defaults: {format: :json}
  resources :doctors ,defaults: {format: :json}
  resources :sessions ,only: [:create],defaults: {format: :json}
  resources :appointments ,defaults: {format: :json}
  resources :medications ,defaults: {format: :json}
  resources :admins ,defaults: {format: :json}
  post 'getbookings', to: 'appointments#getTimeSlots'
  post 'getmedications', to: 'medications#getmedications'
  post 'getapp', to: 'appointments#getapp'
  post 'getPatients', to: 'appointments#getPatients'
  post 'updateMedication', to: 'medications#updateMedication'
  post 'adminSignin', to: 'admins#adminSignin'
  get 'getUsers', to: 'admins#getUsers'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
