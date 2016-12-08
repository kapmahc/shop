module Shop
  class Property < ApplicationRecord
    validates :value, presence: true

    belongs_to :field, class_name: 'Shop::PropertyField', foreign_key: 'shop_property_field_id'
    belongs_to :variant, class_name: 'Shop::Variant', foreign_key: 'shop_variant_id'
  end
end
