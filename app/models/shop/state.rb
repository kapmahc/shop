module Shop
  class State < ApplicationRecord
    validates :name, presence: true

    belongs_to :country, class_name: 'Shop::Country', foreign_key: 'shop_country_id'
  end
end
