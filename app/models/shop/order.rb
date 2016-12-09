module Shop
  class Order < ApplicationRecord
    enum state: {cart: 100, pending:200, delivery:300, confirm:400, complete: 500}

    belongs_to :address, class_name: 'Shop::Address', foreign_key: 'shop_address_id'
    has_many :line_items, class_name: 'Shop::LineItem', foreign_key: 'shop_order_id'

    monetize :item_total_cents
    monetize :total_cents
    monetize :adjustment_total_cents
    monetize :payment_total_cents
  end
end
