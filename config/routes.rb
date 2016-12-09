Shop::Engine.routes.draw do

  scope '/:locale' do
    resources :currencies, only: [:index]
    resources :countries, only: [:index]
    resources :shipping_methods, except: [:show, :destroy]
    resources :payment_methods, except: [:show, :destroy]
    resources :addresses, except: [:show]
    resources :tags
    resources :products

    resources :variants, except: [:show] do
      collection do
        get 'hot'
        get 'latest'
      end

      member do
        get 'properties'
        post 'properties'

        post 'cart'
        delete 'cart'
      end
    end

    resources :property_fields, except: [:show]
    resources :comments, except: [:show]
    resources :orders, except: [:destroy] do
      member do
        get 'pay'
      end
    end

  end

  root 'home#index'
end
