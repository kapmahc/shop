module Shop
  class Payment < ApplicationRecord
    enum state: [:checkout, :balance_due, :pending, :processing, :paid, :credit_owed, :completed, :failed, :void]

    monetize :amount_cents
  end
end
