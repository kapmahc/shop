Shop::Engine.routes.draw do

  scope '/:locale' do
    resources :orders
    resources :products do
      get 'hot'
      get 'latest'
    end
    resources :addresses
  end

  root 'products#hot'
end
