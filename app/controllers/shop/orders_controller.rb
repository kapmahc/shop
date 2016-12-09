require_dependency 'shop/application_controller'

module Shop
  class OrdersController < ApplicationController
    def new
      @order = Order.new
      authorize @order
      ids = session[:variants_cart] || []
      @order.line_items = ids.map do |i|
        v = Variant.find i
        LineItem.new variant:v, price:v.price, quantity:1
      end
      @addresses = Address.where(user_id:current_user.id)
      render layout:'dashboard'
    end

    def create
      @order = Order.new
      authorize @order
      @order.line_items = params.fetch(:quantity).map do |k, v|
        vat = Variant.find k[2..-1]
        LineItem.new variant:vat, price:vat.price, quantity:v
      end
      @order.address = Address.find params[:address]
      puts '#'*80, @order.inspect
      @addresses = Address.where(user_id:current_user.id)
      render 'new', layout: 'dashboard'
    end

    def index
    end

  end
end
