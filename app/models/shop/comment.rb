module Shop
  class Comment < ApplicationRecord
    validates :body, :point, presence: true

    belongs_to :product, class_name: 'Shop::Product', foreign_key: 'shop_product_id'
    belongs_to :user
  end
end
