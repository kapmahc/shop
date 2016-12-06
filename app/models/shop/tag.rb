require 'closure_tree'

module Shop
  class Tag < ApplicationRecord
    validates :name, :sort_order, presence: true

    # https://github.com/mceachen/closure_tree/issues/233
    has_closure_tree order: 'sort_order'

    has_and_belongs_to_many :products, class_name: 'Shop::Product', foreign_key: 'shop_tag_id', association_foreign_key: 'shop_product_id'
  end
end
