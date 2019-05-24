Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :conversations
      resources :messages
      resources :payments
      resources :products
      resources :reviews
      resources :stores

      root to: "users#index"
    end
  resources :payments
  resources :reviews
  resources :products
  resources :stores
  devise_for :users

  root to: "static#homepage"

  get "/vendor" => "stores#vendor"
  get "/support" => "stores#support"
  get "/brand" => "stores#brand"
  get "/dispensary" => "stores#dispensary"
  get "/delivery" => "stores#delivery"
  get "/services" => "stores#services"
  get '/search' => "stores#search"

  resources :conversations, only: [:create] do
    member do
      post :close
    end
  end
end
