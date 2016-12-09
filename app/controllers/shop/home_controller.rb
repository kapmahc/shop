require_dependency 'shop/application_controller'

module Shop
  class HomeController < ApplicationController
    def index
      render layout: 'shop/application'
    end
  end
end
