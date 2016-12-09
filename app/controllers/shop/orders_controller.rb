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
      @addresses = Address.where(user_id:current_user.id)
      @order.line_items = params.fetch(:quantity).map do |k, v|
        vat = Variant.find k[2..-1]
        LineItem.new variant:vat, price:vat.price, quantity:v
      end

      if params[:address] == '0'
        adr = Address.new params.permit(:content, :zip_code, :full_name, :phone)
        adr.user = current_user
        adr.country_code = params.require(:country).fetch(:code)
        if adr.save
          @order.address = adr
        else
          flash[:alert] = adr.errors.full_messages.inspect
          render 'new', layout: 'dashboard'
          return
        end
      else
        @order.address = Address.find params[:address]
      end

      @order.uid = SecureRandom.uuid
      params.fetch(:quantity).each do |k, v|
        vat = Variant.find k[2..-1]
        @order.item_total += vat.price * v.to_i
      end
      # todo tax shipping
      @order.adjustment_total = 5

      @order.total = @order.adjustment_total + @order.item_total

      # todo cupon
      @order.payment_total = @order.total
      @order.cart!

      if @order.save
        redirect_to pay_order_path(@order)
        return
      else
        flash[:alert] = @order.errors.full_messages.inspect
      end
      render 'new', layout: 'dashboard'
    end

    def index
    end

  end
end
