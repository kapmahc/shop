require_dependency 'shop/application_controller'

module Shop
  class PaymentMethodsController < ApplicationController
    layout 'dashboard'
    before_action :must_admin!

    def new
      @payment_method = PaymentMethod.new
      @title = t '.title'
      render 'form'
    end

    def create
      @payment_method = PaymentMethod.create payment_method_params
      if @payment_method.valid?
        redirect_to payment_methods_path
      else
        render 'form'
      end
    end

    def edit
      @payment_method = PaymentMethod.find params[:id]
      @title = t '.title', id:@payment_method.id
      render 'form'
    end

    def update
      @payment_method = PaymentMethod.find params[:id]
      if @payment_method.update(payment_method_params)
        redirect_to payment_methods_path
      else
        render 'form'
      end
    end

    protected
    def payment_method_params
      params.require(:payment_method).permit(:profile, :name, :description, :flag, :active)
    end
  end
end
