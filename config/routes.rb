Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :errors, only: %i[index show]
      get "/error", to: "errors#show_api", as: :show_api
    end
  end

  namespace :admin do
    resources :errors, only: %i[index] do
      member do
        patch "/accept", to: "errors#accept"
        patch "/reject", to: "errors#reject"
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, skip: :registrations
  root "pages#home"
  get "/about", to: "pages#about"

  resources :errors, only: %i[show new create edit update] do
    member do
      patch "/upvote", to: "errors#upvote"
    end
  end

  get "/docs", to: "pages#docs"
  get "/learn", to: "pages#learn"
end
