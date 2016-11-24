Shop::Engine.routes.draw do

  scope '/:locale' do
    resources :shipping_methods, except: [:show, :destroy]
    resources :payment_methods, except: [:show, :destroy]
    resources :currencies, only: [:index, :edit, :update]
    resources :countries, except: [:show, :destroy]

    get 'profile' => 'profile#index'


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
