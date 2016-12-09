require_dependency 'shop/application_controller'

module Shop
  class VariantsController < ApplicationController

    def hot
      @variants = Variant.order(hot_order: :desc).page params[:page]
      @title = t '.title'
      render 'list', layout: 'shop/application'
    end

    def latest
      @variants = Variant.order(latest_order: :desc).page params[:page]
      @title = t '.title'
      render 'list', layout: 'shop/application'
    end

    def cart
      @variant = Variant.find params[:id]
      cart = session[:variants_cart] || []
      cart.unshift @variant.id
      session[:variants_cart] = cart.uniq
      redirect_to product_path(@variant.product)
    end

    def properties
      @variant = Variant.find params[:id]
      authorize @variant, :edit?

      case request.method
        when 'POST'
          items = params.require :items
          Property.where(shop_variant_id: @variant.id).destroy_all
          items.each {|k, v| Property.create shop_variant_id: @variant.id, shop_property_field_id: k[2..-1], value: v}

          redirect_to variants_path(shop_product_id:@variant.shop_product_id)
        else
          @property_fields = PropertyField.where(lang:I18n.locale).order(sort_order: :asc)
          render layout:'dashboard'
      end


    end

    def new
      @variant = Variant.new params.permit(:shop_product_id)
      authorize @variant
      render layout:'dashboard'
    end

    def create
      @variant = Variant.new params.require(:variant).permit(:shop_product_id, :name, :price, :cost_price, :sku, :hot_order, :latest_order, :state)
      authorize @variant

      if @variant.save
        redirect_to variants_path(shop_product_id:@variant.product.id)
      else
        render 'new', layout:'dashboard'
      end
    end

    def edit
      @variant = Variant.find params[:id]
      authorize @variant

      render layout:'dashboard'
    end

    def update
      @variant = Variant.find params[:id]
      authorize @variant
      if @variant.update params.require(:variant).permit(:name, :price, :cost_price, :sku, :hot_order, :latest_order, :state)
        redirect_to variants_path(shop_product_id:@variant.product.id)
      else
        render 'edit', layout:'dashboard'
      end
    end

    def index
      authorize Variant.new
      @variants = Variant.where(params.permit(:shop_product_id)).order(price_cents: :asc)
      render layout:'dashboard'
    end

    def destroy
      @variant = Variant.find params[:id]
      authorize @variant
      @variant.destroy
      redirect_to variants_path(shop_product_id:@variant.product.id)
    end

  end
end
