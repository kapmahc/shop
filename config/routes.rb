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

      member do
        %w(hot latest).each do |act|
          get act
          post act
        end
      end
    end


    get 'profile' => 'profile#index'


    resources :orders

  end

  root 'products#hot'
end
