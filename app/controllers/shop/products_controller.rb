require_dependency 'shop/application_controller'

module Shop
  class ProductsController < ApplicationController

    def hot
      @products = Product.order(hot_order: :desc).page params[:page]
      @title = t '.title'
      render 'list', layout: 'shop/application'
    end

    def latest
      @products = Product.order(latest_order: :desc).page params[:page]
      @title = t '.title'
      render 'list', layout: 'shop/application'
    end

    def show
      @product = Product.find params[:id]
      history = session[:products_history] || []
      history.unshift @product.id
      session[:products_history] = history.uniq
      render layout: 'shop/application'
    end

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
      @products = Product.order(updated_at: :desc).page params[:page]
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
      params.require(:product).permit(:name, :description, :hot_order, :latest_order, tag_ids: [])
    end
  end
end
