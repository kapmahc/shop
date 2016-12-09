module Shop
  class Variant < ApplicationRecord
    validates :name, :price, presence: true
    validates :sku, presence: true, uniqueness: true

    enum state: [:online, :hot, :latest, :out_of_stock]

    belongs_to :product, class_name: 'Shop::Product', foreign_key: 'shop_product_id'
    has_many :properties, class_name: 'Shop::Property', foreign_key: 'shop_variant_id'

    monetize :price_cents
    monetize :cost_price_cents

  end
end
