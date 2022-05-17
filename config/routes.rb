Rails.application.routes.draw do

    root to: 'homes#top' 
    get 'about' => 'homes#about'

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    
    resources :genres, only: [:index, :create, :edit, :update]
    
    resources :items, except: [:destroy]
    
    resources :orders, only: [:index, :show, :update]
    
    resources :order_details, only: [:update]
  end

  
  resources :items, only: [:index, :show]
  
  resources :customers, only: [:show, :edit, :update] 
  get 'customers/quit', as: 'quit'
  patch 'customers/withdraw', as: 'withdraw'
  
  resources :shipping_addresses, only: [:create, :index, :edit, :update, :destroy]
  
  resources :cart_items, only: [:index, :create, :update, :destroy]
  delete 'cart_items/empty', as: 'empty'
  
  resources :orders, only: [:new, :create, :index, :show]
  get 'orders/completed', as: 'completed'
  post 'orders/confirmation', as: 'confirmation'
  
  
  
  
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
