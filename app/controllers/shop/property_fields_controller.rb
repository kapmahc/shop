require_dependency "shop/application_controller"

module Shop
  class PropertyFieldsController < ApplicationController

    def new
      @property_field = PropertyField.new sort_order:0
      authorize @property_field
      @title = t '.title'
      render 'form',layout:'dashboard'
    end

    def create
      @property_field = PropertyField.new property_field_params
      @property_field.lang = I18n.locale
      authorize @property_field

      if @property_field.save
        redirect_to property_fields_path
      else
        @title =t 'shop.property_fields.new.title'
        render 'form', layout:'dashboard'
      end
    end

    def edit
      @property_field = PropertyField.find params[:id]
      authorize @property_field
      @title = t '.title', id:@property_field.id
      render 'form',layout:'dashboard'
    end

    def update
      @property_field = PropertyField.find params[:id]
      authorize @property_field
      if @property_field.update property_field_params
        redirect_to property_fields_path
      else
        @title = t 'shop.property_fields.edit.title',id:@property_field.id
        render 'form', layout:'dashboard'
      end
    end

    def index
      authorize PropertyField.new
      @property_fields = PropertyField.where(lang:I18n.locale).order(sort_order: :asc)
      render layout:'dashboard'
    end

    def destroy
      @property_field = PropertyField.find params[:id]
      authorize @property_field
      @property_field.destroy
      redirect_to property_fields_path
    end

    private
    def property_field_params
      params.require(:property_field).permit(:name, :sort_order)
    end
  end
end
