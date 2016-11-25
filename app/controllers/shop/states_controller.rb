require_dependency "shop/application_controller"

module Shop
  class StatesController < ApplicationController
    layout 'dashboard'
    before_action :must_admin!

    def new
      @state = State.new
      @state.shop_country_id = params[:country_id]
    end

    def create
      @state = State.create params.require(:state).permit(:name, :shop_country_id)
      if @state.valid?
        redirect_to edit_country_path(@state.country)
      else
        render 'new'
      end
    end

    def edit
      @state = State.find params[:id]
    end

    def update
      @state = State.find params[:id]
      if @state.update(params.require(:state).permit(:name))
        redirect_to edit_country_path(@state.country)
      else
        render 'edit'
      end
    end
  end
end
