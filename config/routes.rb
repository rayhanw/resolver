Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  root "pages#home"
  get "/about", to: "pages#about"

  resources :errors, only: %i[show new create] do
    member do
      patch "/upvote", to: "errors#upvote"
    end
  end
end
