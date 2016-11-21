module Shop
  class State < ApplicationRecord
    validates :name, presence: true

    belongs_to :shop_country, class_name: 'Shop::Country'
  end
end
