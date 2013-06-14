Cookbook::Application.routes.draw do
  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  match "signup" => 'authors#new', :as => "signup"
  match "login" => 'sessions#new', :as => "login"
  match "logout" => 'sessions#destroy', :as => "logout"

  resources :sessions, :except => [:edit, :update, :index]

  resources :steps
  resources :recipes
  resources :comments
  resources :ingredients

  root :to => 'recipes#index'

end
