module Shop
  class Product < ApplicationRecord
    validates :name, :description, presence: true

    has_many :comments, class_name: 'Shop::Comment', foreign_key: 'shop_product_id'
    has_and_belongs_to_many :tags, class_name: 'Shop::Tag', foreign_key: 'shop_product_id', association_foreign_key: 'shop_tag_id'
  end
end
