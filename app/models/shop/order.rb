module Shop
  class Order < ApplicationRecord
    enum state: {
             pending:100,
             paid:200,
             processing:300,
             delivery:400,
             confirm:500,
             complete: 600,
         }

    belongs_to :user
    belongs_to :address, class_name: 'Shop::Address', foreign_key: 'shop_address_id'
    has_many :line_items, class_name: 'Shop::LineItem', foreign_key: 'shop_order_id'

    monetize :item_total_cents
    monetize :total_cents
    monetize :adjustment_total_cents
    monetize :payment_total_cents
  end
end
