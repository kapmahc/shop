require_dependency 'shop/application_controller'
require 'country_select'

module Shop
  class CountriesController < ApplicationController
    layout 'dashboard'
    before_action :must_admin!
  end
end
