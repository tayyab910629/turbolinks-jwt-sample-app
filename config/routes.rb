Rails.application.routes.draw do
  root to: 'splash_page#index'
  get '/home', to: 'home#index', as: :home
  get '/products', to: 'products#index'
  resources :widgets
  resources :customs
  get '/c_page', to: 'customs#c_page'
  get 'splash_page/index', to: 'splash_page#index'
  get 'splash_page/index', to: 'splash_page#index'

  get '/orders' , to: 'orders#index'

  post '/orders/orders_create', to: 'orders#orders_create'


  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



