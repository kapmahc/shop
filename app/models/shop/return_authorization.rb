module Shop
  class ReturnAuthorization < ApplicationRecord
    enum state: [:authorized, :canceled]
    monetize :amount_cents
  end
end
