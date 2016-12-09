module Shop
  class LineItem < ApplicationRecord
    belongs_to :order, class_name: 'Shop::Order', foreign_key: 'shop_order_id'
    belongs_to :variant, class_name: 'Shop::Variant', foreign_key: 'shop_variant_id'

    monetize :price_cents
  end
end
