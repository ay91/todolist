Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: "users/registrations", sessions: "users/sessions" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landing#index'
  post :complete, to: 'tasks#complete'
  resources :tasks

  namespace :api do
    namespace :v1 do
      resources :tasks do        
        post :complete, to: 'tasks#complete'
      end
      resources :sessions, only: [:create]
      match "registration" => "registration#create", via: :post
    end
  end
end
