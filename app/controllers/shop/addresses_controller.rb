require_dependency 'shop/application_controller'

module Shop
  class AddressesController < ApplicationController
    def index
      authorize Address.new
      @addresses = Address.where(user_id: :current_user.id).order(updated_at: :desc)
    end

    def new
      @address = Address.new
      authorize @address
      @title = t '.title'
      render 'form'
    end

    def create
      @address = Address.new address_params
      authorize @address
      @address.user = current_user
      if @address.save
        redirect_to addresses_path
      else
        render 'form'
      end
    end


    def edit
      @address = Address.find params[:id]
      authorize @address
      @title = t '.title', id:@address.id
      render 'form'
    end

    def update
      @address = Address.find params[:id]
      authorize @address
      if @address.update(address_params)
        redirect_to addresses_path
      else
        render 'form'
      end
    end


    def destroy
      @address = Address.find params[:id]
      authorize @address
      @address.destroy
      redirect_to addresses_path
    end

    protected
    def address_params
      params.require(:address).permit(
          :first_name, :last_name,
          :address1, :address2,
          :phone1, :phone2,
          :zip_code,
          :shop_state_id,
      )
    end
  end
end
