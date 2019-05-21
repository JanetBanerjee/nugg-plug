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
  get "/add_product" => "stores#add_product"
  get "/new_vendor" => "stores#new_vendor"

  resources :conversations, only: [:create] do
    member do
      post :close
    end
  end
end
