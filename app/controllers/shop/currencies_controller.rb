require_dependency 'shop/application_controller'

module Shop
  class CurrenciesController < ApplicationController
    layout 'dashboard'
    before_action :must_admin!

    def edit
      @currency = Currency.find params[:id]
    end

    def update
      @currency = Currency.find params[:id]
      if @currency.update(params.require(:currency).permit(:active, :rate))
        redirect_to currencies_path
      else
        render 'edit'
      end
    end

  end
end
