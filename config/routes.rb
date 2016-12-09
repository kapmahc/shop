Shop::Engine.routes.draw do

  scope '/:locale' do
    resources :currencies, only: [:index]
    resources :countries, only: [:index]
    resources :shipping_methods, except: [:show, :destroy]
    resources :payment_methods, except: [:show, :destroy]
    resources :addresses, except: [:show]
    resources :tags
    resources :products do
      collection do
        get 'hot'
        get 'latest'
      end
    end

    resources :variants, except: [:show] do
      member do
        get 'properties'
        post 'properties'
      end
    end

    resources :property_fields, except: [:show]

    resources :comments, except: [:show]

# todo
    get 'profile' => 'profile#index'


    resources :orders

  end

  root 'products#hot'
end
