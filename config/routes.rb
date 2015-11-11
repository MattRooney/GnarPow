Rails.application.routes.draw do
  resources :items, only: [:index]
  resources :cart_items, only: [:create, :destroy]
  resources :categories, only: [:show, :index], param: :slug

  get '/cart', to: "cart#show"
end
