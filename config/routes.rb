Shop::Engine.routes.draw do

  scope '/:locale' do
    resources :shipping_methods, except: [:show, :destroy]
    resources :payment_methods, except: [:show, :destroy]
    resources :addresses, except: [:show]

    resources :currencies, only: [:index]
    resources :countries, only: [:index]

    get 'profile' => 'profile#index'


    resources :orders
    resources :products do
      get 'hot'
      get 'latest'
    end
    resources :returns
  end

  root 'products#hot'
end
