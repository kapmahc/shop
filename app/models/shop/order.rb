module Shop
  class Order < ApplicationRecord
    monetize :item_total_cents
    monetize :total_cents
    monetize :adjustment_total_cents
    monetize :payment_total_cents
  end
end
