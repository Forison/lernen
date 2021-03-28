Rails.application.routes.draw do
  resources :products
  resources :orders, only: [:create, :index, :show, :destroy]
  post '/checkout', to: "orders#checkout"
  get'/checkout'
  root "products#index"
end
