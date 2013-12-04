Media::Application.routes.draw do
  authenticated :user do
    root :to => 'media_items#index'
  end

  root :to => "home#index"
  devise_for :users
  resources :users
  resources :types
  resources :media_items
  resources :borrow_receipts

  get '/library', to: 'library#index', as: 'library'
end
