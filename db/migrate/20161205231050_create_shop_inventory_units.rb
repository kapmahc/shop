class CreateShopInventoryUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_inventory_units do |t|
      t.integer :lock_version, null:false

      # :backordered :on_hand :shipped :returned
      t.string :state, limit:16, index:true, null:false

      t.belongs_to :shop_order, foreign_key: true
      t.belongs_to :shop_variant, foreign_key: true
      t.belongs_to :shop_shipment, foreign_key: true
      t.belongs_to :shop_return_authorization, foreign_key: true

      t.timestamps
    end
  end
end
