require_dependency 'shop/application_controller'

module Shop
  class Admin::ShippingMethodsController < ApplicationController
    layout 'dashboard'
    before_action :must_admin!

    def new
      @shipping_method = ShippingMethod.new
      @title = t '.title'
      render 'form'
    end

    def create
      @shipping_method = ShippingMethod.create shipping_method_params
      if @shipping_method.valid?
        redirect_to admin_shipping_methods_path
      else
        render 'form'
      end
    end

    def edit
      @shipping_method = ShippingMethod.find params[:id]
      @title = t '.title'
      render 'form'
    end

    def update
      @shipping_method = ShippingMethod.find params[:id]
      if @shipping_method.update(shipping_method_params)
        redirect_to admin_shipping_methods_path
      else
        render 'form'
      end
    end

    protected
    def shipping_method_params
      params.require(:shipping_method).permit(:profile, :name, :description, :tracking, :active)
    end
  end
end
