Shop::Engine.routes.draw do
  get 'dashboard' => 'home#dashboard'

  root 'home#index'
end
