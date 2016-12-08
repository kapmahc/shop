module Shop
  class Product < ApplicationRecord
    validates :name, :description, presence: true

    has_many :comments, class_name: 'Shop::Comment', foreign_key: 'shop_product_id'
    has_many :variants, class_name: 'Shop::Variant', foreign_key: 'shop_product_id'
    has_and_belongs_to_many :tags, class_name: 'Shop::Tag', foreign_key: 'shop_product_id', association_foreign_key: 'shop_tag_id'

    has_many :attachments, -> { order(sort_order: :asc) }, as: :resource

    def pictures
      attachments.select {|i| i.image?}
    end
  end
end
