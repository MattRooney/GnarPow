Rails.application.routes.draw do
  resources :items, only: [:index]
  resources :categories, only: [:show, :index], param: :slug
end
