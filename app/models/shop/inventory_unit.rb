module Shop
  class InventoryUnit < ApplicationRecord
    enum state: [:back_ordered, :on_hand, :shipped, :returned]
  end
end
