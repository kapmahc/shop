require_dependency 'shop/application_controller'

module Shop
  class ProductsController < ApplicationController

    def new
      @product = Product.new
      authorize @product
      @title = t '.title'
      render 'form', layout:'dashboard'
    end

    def create
      @product = Product.new product_params
      authorize @product
      if @product.save
        redirect_to products_path
      else
        @title =t 'shop.products.new.title'
        render 'form', layout:'dashboard'
      end
    end

    def edit
      @product = Product.find params[:id]
      authorize @product
      @title = t '.title', id:@product.id
      render 'form', layout:'dashboard'
    end

    def update
      @product = Product.find params[:id]
      authorize @product
      if @product.update product_params
        redirect_to products_path
      else
        @title = t 'shop.products.edit.title',id:@product.id
        render 'form', layout:'dashboard'
      end
    end

    def index
      authorize Product.new
      @products = Product.select(:id, :name).order(updated_at: :desc).page params[:page]
      render layout:'dashboard'
    end

    def destroy
      @product = Product.find params[:id]
      authorize @product
      @product.destroy
      redirect_to products_path
    end

    private
    def product_params
      params.require(:product).permit(:name, :description, tag_ids: [])
    end
  end
end
