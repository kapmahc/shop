module Shop
  class Shipment < ApplicationRecord
    enum state: [:ready, :pending, :assemble, :partial, :cancelled, :shipped, :back_order, :completed, :canceled]

    monetize :cost_cents
  end
end
