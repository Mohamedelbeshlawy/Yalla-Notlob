Rails.application.routes.draw do
  devise_for :users,  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :friends
  resources :orders
  resources :groups
  resources :groups_users

  root to: "home#index"

  
  get '/friends/:id/accept', to: 'friends#accept'
  get '/friends/:id/decline', to: 'friends#decline'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :notifications do
    collection do
      post :mark_as_read
    end
  end
  

  get "/orders", to: "orders#index"
  get '/orders/new', to: 'orders#new'
  post '/orders', to: 'orders#create', as: 'newOrder'
  get '/orders/:id/show', to: 'orders#show', as: 'viewOrder'
  get '/orders/:id/cancel', to: 'orders#cancel', as: 'cancelOrder'
  get '/orders/:id/finish', to: 'orders#finish', as: 'finishOrder'

  get '/orders/invite/:id' => 'orders#inviteFriends', as: 'inviteFriends'
  post '/orders/invite/:id' => 'orders#invite', as: 'invite'
  post '/orders/inviteGroup/:id' => 'orders#inviteGroup', as: 'inviteGroup'
  delete '/orders/invite/:id' => 'orders#cancelInvitation', as: 'cancel'

  get '/orders/:id/items/new', to: 'items#new'
   
  post '/orders/:id/', to: 'items#create', as: 'newItem'
  get '/orders/:id/items/:item_id/delete', to: 'items#delete',as: 'deleteItem'

end
