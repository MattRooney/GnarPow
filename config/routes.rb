Rails.application.routes.draw do
  resources :items, only: [:index]
  resources :categories, only: [:show], param: :slug
  resources :cart_items, only: [:create]
end
