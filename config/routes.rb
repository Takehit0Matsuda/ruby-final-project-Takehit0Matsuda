Rails.application.routes.draw do
  get "signup" => "users#new"
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
  get "users" => "users#show"
  get "/auth/:provider/callback" => "authentications#create"
  
  resources :users, except: [:index, :new]
  resources :sessions, except: [:index, :edit, :update, :show, :new, :destroy]
  resources :meal_logs do 
    resources :comments
  end
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about" => "sites#about"
  get "components" => "sites#components"
  # Defines the root path route ("/")
  root "sites#index"
end
