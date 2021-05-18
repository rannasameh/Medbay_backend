Rails.application.routes.draw do
  
  resources :patients ,defaults: {format: :json}
  resources :doctors ,defaults: {format: :json}
  resources :sessions ,only: [:create],defaults: {format: :json}
  resources :appointments ,defaults: {format: :json}

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
