Shop::Engine.routes.draw do

  scope '/:locale' do

    namespace :admin do
      get 'profile' => 'profile#index'

      resources :products
      resources :orders
      resources :returns

      resources :shipping_methods, except: [:show, :destroy]
      resources :payment_methods, except: [:show, :destroy]
    end

    resources :orders
    resources :products do
      get 'hot'
      get 'latest'
    end
    resources :addresses
    resources :returns
  end

  root 'products#hot'
end
