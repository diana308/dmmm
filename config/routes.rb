require './app/store'
Rails.application.routes.draw do

  get 'form/input'

  Rails.application.routes.draw do
  get 'form/input'
  match 'catalog' => StoreApp.new, via: :all
    get 'admin' => 'admin#index'
    controller :sessions do
      get  'login' => :new
      post 'login' => :create
      delete 'logout' => :destroy
    end

    resources :users
    resources :products do
      get :download, on: :member
      get :who_bought, on: :member
    end

    scope '(:locale)' do
      resources :orders
      resources :line_items
      resources :carts
      root 'store#index', as: 'store_index', via: :all
    end
  end
  end