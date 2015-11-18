Rails.application.routes.draw do
  get '/', to: 'home#home'
  get '/deal', to: 'home#deal'
  get '/cart', to: 'cart#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :cart_items, only: [:create, :destroy, :update]
  resources :items, only: [:index, :show]
  resources :categories, only: [:show, :index], param: :slug
  resources :users, only: [:new, :create, :show, :edit, :update]
  namespace :admin do
    resources :items, only: [:index, :show, :new, :create, :destroy]
    resources :dashboard, only: [:show, :index]
    resources :categories, only: [:show, :index], param: :slug
  end
  post '/admin/dashboard', to: 'admin/dashboard#daily_deal'
  resources :orders, only: [:index, :show, :create, :update]
end
