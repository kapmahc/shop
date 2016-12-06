module Shop
  class Payment < ApplicationRecord
    monetize :amount_cents
  end
end
