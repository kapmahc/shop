Shop::Engine.routes.draw do

  scope '/:locale' do

    get 'profile' => 'profile#index'

    resources :shipping_methods, except: [:show, :destroy]
    resources :payment_methods, except: [:show, :destroy]

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
