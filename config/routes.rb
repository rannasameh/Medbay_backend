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
  post 'verifyDoctor', to: 'admins#verifyDoctor'
  post 'banDoctor', to: 'admins#banDoctor'
  get 'getBannedDoctors', to: 'admins#getBannedDoctors'
  post 'increamentReports', to: 'doctors#increamentReports'
  get 'getReportedDoctors', to: 'admins#getReportedDoctors'
  get 'getNotVerifiedDoctors', to: 'admins#getNotVerifiedDoctors'

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
