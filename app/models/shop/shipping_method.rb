module Shop
  class ShippingMethod < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    attr_encrypted :profile
  end
end
