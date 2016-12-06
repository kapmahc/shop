require_dependency 'shop/application_controller'
require 'country_select'

module Shop
  class AddressesController < ApplicationController
    layout 'dashboard'

    def index
      authorize Address.new
      @addresses = Address.where(user_id: current_user.id).order(updated_at: :desc)
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

      puts '#'*80, @address.inspect
      if @address.save
        redirect_to addresses_path
      else
        @title = t 'shop.addresses.new.title'
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
        @title = t 'shop.addresses.edit.title', id:@address.id
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
          :full_name,
          :content,
          :phone,
          :zip_code,
          :country_code
      )
    end
  end
end
