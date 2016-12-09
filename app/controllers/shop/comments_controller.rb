require_dependency "shop/application_controller"

module Shop
  class CommentsController < ApplicationController
    def new
      @comment = Comment.new params.permit(:shop_product_id)
      @comment.point = 1
      authorize @comment
    end

    def create
      @comment = Comment.new params.require(:comment).permit(:shop_product_id, :body, :point)
      authorize @comment
      @comment.user = current_user
      if @comment.save
        redirect_to product_path(@comment.product)
      else
        render 'new'
      end
    end

    def edit
      @comment = Comment.find params[:id]
      authorize @comment
    end

    def update
      @comment = Comment.find params[:id]
      authorize @comment
      if @comment.update params.require(:comment).permit(:body, :point)
        redirect_to product_path(@comment.product)
      else
        render 'edit'
      end
    end

    def destroy
      @comment = Comment.find params[:id]
      authorize @comment
      @comment.destroy

      redirect_to product_path(@comment.product)
    end


    def index
      @comments = Comment.order(updated_at: :desc).page params[:page]
    end
  end
end
