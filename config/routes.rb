Rails.application.routes.draw do
  get "/", to: "items#index"
  resources :items, only: [:index]
  resources :cart_items, only: [:create, :destroy]
  resources :categories, only: [:show, :index], param: :slug
  resources :users, only: [:new, :create, :show]
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get '/cart', to: "cart#show"
end
