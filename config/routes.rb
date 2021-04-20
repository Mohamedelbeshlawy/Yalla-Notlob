Rails.application.routes.draw do
  devise_for :users
  resources :orders
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/orders", to: "orders#index"
  get '/orders/new', to: 'orders#new'
  post '/orders', to: 'orders#create', as: 'newOrder'
  post '/orders/:id/cancel', to: 'orders#cancel', as: 'cancelOrder'
  post '/orders/:id/finish', to: 'orders#finish', as: 'finishOrder'

  get '/orders/:id', to: 'items#index', as: 'index'
  post '/orders/:id', to:'items#new', as: 'newItem'

end
