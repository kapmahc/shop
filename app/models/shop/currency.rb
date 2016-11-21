module Shop
  class Currency < ApplicationRecord
    validates :cid, :code, :name, :country, :units, presence: true
  end
end
