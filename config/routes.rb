Rails.application.routes.draw do
  get "/", to: "items#index"
  get '/cart', to: "cart#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :cart_items, only: [:create, :destroy, :update]
  resources :items, only: [:index, :show]
  resources :categories, only: [:show, :index], param: :slug
  resources :users, only: [:new, :create, :show]
  resources :orders, only: [:index, :show, :create]

end
