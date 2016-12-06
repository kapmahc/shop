require_dependency 'shop/application_controller'

module Shop
  class TagsController < ApplicationController
    layout 'dashboard'

    def new
      @tag = Tag.new params.permit(:parent_id).merge(sort_order:0)
      authorize @tag
    end

    def create
      @tag = Tag.new params.require(:tag).permit(:parent_id,:sort_order, :name)
      authorize @tag
      if @tag.save
        redirect_to tags_path
      else
        render 'new'
      end
    end

    def edit
      @tag = Tag.find params[:id]
      authorize @tag
    end

    def update
      @tag = Tag.find params[:id]
      authorize @tag
      if @tag.update params.require(:tag).permit(:name, :sort_order)
        redirect_to tags_path
      else
        render 'new'
      end
    end

    def index
      authorize Tag.new
    end

    def destroy
      @tag = Tag.find params[:id]
      authorize @tag
      @tag.destroy
      redirect_to tags_path
    end

  end
end
