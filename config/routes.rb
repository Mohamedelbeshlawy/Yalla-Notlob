Rails.application.routes.draw do
  devise_for :users
  resources :friends
  resources :orders
  root to: "home#index"
  
  get '/friends/:id/accept', to: 'friends#accept'
  get '/friends/:id/decline', to: 'friends#decline'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/orders", to: "orders#index"
  get '/orders/new', to: 'orders#new'
  post '/orders', to: 'orders#create', as: 'newOrder'
  post '/orders/:id/cancel', to: 'orders#cancel', as: 'cancelOrder'
  post '/orders/:id/finish', to: 'orders#finish', as: 'finishOrder'

  get '/orders/:id/items', to: 'items#index'
  get '/orders/:id/items/new', to: 'items#new'
  post '/orders/:id/items', to: 'items#create', as: 'newItem'

end
