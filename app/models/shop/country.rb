module Shop
  class Country < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    has_many :shop_states, class_name: 'Shop::State'
  end
end
