module Shop
  class Property < ApplicationRecord

    belongs_to :variant, class_name: 'Shop::Variant', foreign_key: 'shop_variant_id'
  end
end
