require_dependency 'shop/application_controller'

module Shop
  class TagsController < ApplicationController
    layout 'dashboard'
    before_action :must_admin!

    def new
      @tag = Tag.new params.permit(:parent_id)
    end

    def create
      @tag = Tag.new params.require(:tag).permit(:parent_id,:sort_order, :name)
      if @tag.save
        redirect_to tags_path
      else
        render 'new'
      end
    end

    def edit
      @tag = Tag.find params[:id]
    end

    def update
      @tag = Tag.find params[:id]
      if @tag.update params.require(:tag).permit(:name, :sort_order)
        redirect_to tags_path
      else
        render 'new'
      end
    end

    def destroy
      @tag = Tag.find params[:id]
      @tag.destroy
      redirect_to tags_path
    end

  end
end
