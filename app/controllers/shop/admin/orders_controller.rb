require_dependency 'shop/application_controller'

module Shop
  class Admin::OrdersController < ApplicationController
    layout 'dashboard'
    before_action :must_admin!

    def index
    end
  end
end
