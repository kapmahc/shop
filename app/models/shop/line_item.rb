module Shop
  class LineItem < ApplicationRecord
    monetize :price_cents
  end
end
