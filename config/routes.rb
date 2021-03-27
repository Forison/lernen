Rails.application.routes.draw do
  resources :products
  resources :orders, only: [:create, :index, :show]
  root "products#index"
end
