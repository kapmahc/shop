Shop::Engine.routes.draw do


  scope '/:locale' do
    resources :currencies, only: [:index]
    resources :countries, only: [:index]
    resources :shipping_methods, except: [:show, :destroy]
    resources :payment_methods, except: [:show, :destroy]
    resources :tags, except: [:show]

    resources :addresses, except: [:show]


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
