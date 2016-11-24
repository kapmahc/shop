module Shop
  class ShippingMethod < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    attr_encrypted :profile, key: ENV['SECRET_KEY_BASE']
  end
end
