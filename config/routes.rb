Rails.application.routes.draw do
  get '/products', to: 'parts#public_index'
  get '/contact_us', to: 'pages#contact_us'
  get '/manufacturers', to: 'pages#manufacturers'
  constraints subdomain: ['', 'www'] do
    get '/', to: 'pages#home'
    devise_for :users
    resources :parts
    resources :leads, only: [:create, :index, :destroy]
  end

  root to: 'parts#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
