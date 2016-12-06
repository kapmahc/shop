module Shop
  class ReturnAuthorization < ApplicationRecord
    monetize :amount_cents
  end
end
