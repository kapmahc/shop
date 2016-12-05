module Shop
  class Address < ApplicationRecord
    validates :first_name,:last_name, :address1, :phone1, :zip_code, :shop_state_id, presence: true
  end
end
