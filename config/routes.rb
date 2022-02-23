Rails.application.routes.draw do
  get 'errors/new'
  get 'errors/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "pages#home"

  resources :errors, only: %i[new create]
end
