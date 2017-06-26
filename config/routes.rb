Rails.application.routes.draw do
  get '/products', to: 'parts#public_index'
  get '/contact_us', to: 'pages#contact_us'
  get '/manufacturers', to: 'pages#manufacturers'
  get '/about', to: 'pages#about'
  resources :leads, only: [:create]

  constraints subdomain: ['', 'www'] do
    get '/', to: 'pages#home'
    resources :parts
  end
  constraints subdomain: ['admin'] do
    root to: 'parts#index'
    devise_for :users
    resources :parts
    resources :leads, only: [:create, :index, :destroy]
  end

  root to: 'parts#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
