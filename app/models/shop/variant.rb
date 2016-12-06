module Shop
  class Variant < ApplicationRecord
    monetize :price_cents
    monetize :cost_price_cents

  end
end
