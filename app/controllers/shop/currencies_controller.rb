require_dependency 'shop/application_controller'
require 'money'

module Shop
  class CurrenciesController < ApplicationController
    layout 'dashboard'
    before_action :must_admin!

  end
end
