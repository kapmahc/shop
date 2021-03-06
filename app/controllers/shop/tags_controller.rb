require_dependency 'shop/application_controller'

module Shop
  class TagsController < ApplicationController
    def show
      @tag = Tag.find params[:id]
      render layout:'shop/application'
    end

    def new
      @tag = Tag.new params.permit(:parent_id).merge(sort_order:0)
      authorize @tag
      render layout:'dashboard'
    end

    def create
      @tag = Tag.new params.require(:tag).permit(:parent_id,:sort_order, :name)
      authorize @tag
      if @tag.save
        redirect_to tags_path
      else
        render 'new', layout:'dashboard'
      end
    end

    def edit
      @tag = Tag.find params[:id]
      authorize @tag
      render layout:'dashboard'
    end

    def update
      @tag = Tag.find params[:id]
      authorize @tag
      if @tag.update params.require(:tag).permit(:name, :sort_order)
        redirect_to tags_path
      else
        render 'new', layout:'dashboard'
      end
    end

    def index
      authorize Tag.new
      render layout:'dashboard'
    end

    def destroy
      @tag = Tag.find params[:id]
      authorize @tag
      @tag.destroy
      redirect_to tags_path
    end

  end
end
