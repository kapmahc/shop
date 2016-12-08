module Shop
  class Property < ApplicationRecord
    validates :key, :value, presence: true
    validates :key, uniqueness: { scope: :shop_variant_id}
  end
end
