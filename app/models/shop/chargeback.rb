module Shop
  class Chargeback < ApplicationRecord
    monetize :amount_cents
  end
end
