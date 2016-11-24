Shop::Engine.routes.draw do

  scope '/:locale' do

    namespace :admin do
      get 'profile' => 'profile#index'

      resources :products
      resources :orders
      resources :returns
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
