Rails.application.routes.draw do
  resources :products
  resources :orders, only: [:create, :index, :show, :destroy]
  root "products#index"
end
