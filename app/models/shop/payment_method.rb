module Shop
  class PaymentMethod < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :flag, presence: true

    attr_encrypted :profile
  end
end
