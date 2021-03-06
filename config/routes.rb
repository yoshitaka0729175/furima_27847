Rails.application.routes.draw do
  get 'cards/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :users, only: [:show, :update]


  root to: 'items#index'
  resources :items do
    resources :orders, only:[:index, :create]
  end
  
  namespace :api do
    resources :items, only: :index, defaults: { format: 'json' }
  end

end
