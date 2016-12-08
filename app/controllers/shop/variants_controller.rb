require_dependency 'shop/application_controller'

module Shop
  class VariantsController < ApplicationController

    def new
      @variant = Variant.new params.permit(:shop_product_id)
      authorize @variant
      @title = t '.title'
      render layout:'dashboard'
    end

    def create
      @variant = Variant.new params.require(:variant).permit(:shop_product_id, :name, :price, :cost_price, :sku)
      authorize @variant

      if @variant.save
        redirect_to variants_path(shop_product_id:@variant.product.id)
      else
        @title =t 'shop.variants.new.title'
        render 'new', layout:'dashboard'
      end
    end

    def edit
      @variant = Variant.find params[:id]
      authorize @variant
      @title = t '.title', id:@variant.id
      render layout:'dashboard'
    end

    def update
      @variant = Variant.find params[:id]
      authorize @variant
      if @variant.update params.require(:variant).permit(:name, :price, :cost_price, :sku)
        redirect_to variants_path(shop_product_id:@variant.product.id)
      else
        @title = t 'shop.variants.edit.title',id:@variant.id
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
