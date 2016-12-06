module Shop
  class Shipment < ApplicationRecord
    monetize :cost_cents
  end
end
