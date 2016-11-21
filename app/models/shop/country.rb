module Shop
  class Country < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    has_many :states, class_name: 'Shop::State', foreign_key: 'shop_country_id'
  end
end
