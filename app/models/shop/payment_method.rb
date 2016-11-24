module Shop
  class PaymentMethod < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :flag, presence: true

    attr_encrypted :profile, key: ENV['SECRET_KEY_BASE']
  end
end
