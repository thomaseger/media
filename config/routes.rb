Media::Application.routes.draw do
  get "ownerships/create"

  get "ownerships_controller/create"

  authenticated :user do
    root :to => 'media_items#index'
  end

  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users
  resources :types
  resources :media_items
  resources :ownerships
  resources :borrow_receipts

  get '/library', to: 'library#index', as: 'library'
end
