Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :conversations
      resources :messages
      resources :payments
      resources :products
      resources :reviews
      resources :stores

      root to: "stores#index"
    end
  resources :payments
  resources :reviews
  resources :products
  resources :stores
  devise_for :users

  root to: "stores#index"

  get "/vendor" => "stores#vendor"
  get "/support" => "stores#support"
  get "/brand" => "stores#brand"
  get "/dispensary" => "stores#dispensary"
  get "/delivery" => "stores#delivery"
  get "/service" => "stores#service"
  get '/search' => "stores#search"
  get '/store_created' => "stores#store_created"

  resources :conversations, only: [:create] do
    member do
      post :close
    end
  end
end
