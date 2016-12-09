module Shop
  class Order < ApplicationRecord
    enum state: [:cart, :address, :delivery, :payment, :confirm, :complete]

    has_many :line_items, class_name: 'Shop::LineItem', foreign_key: 'shop_order_id'

    monetize :item_total_cents
    monetize :total_cents
    monetize :adjustment_total_cents
    monetize :payment_total_cents
  end
end
