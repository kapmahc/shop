require_dependency 'shop/application_controller'

module Shop
  class CountriesController < ApplicationController
    layout 'dashboard'
    before_action :must_admin!

    def new
      @country = Country.new
    end

    def create
      @country = Country.create country_params
      if @country.valid?
        redirect_to countries_path
      else
        render 'new'
      end
    end

    def edit
      @country = Country.find params[:id]
    end

    def update
      @country = Country.find params[:id]
      if @country.update(country_params)
        redirect_to countries_path
      else
        render 'edit'
      end
    end

    protected
    def country_params
      params.require(:country).permit(:name, :active)
    end
  end
end
