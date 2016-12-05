class CreateShopShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_shipments do |t|
      t.string :tracking, null:false
      t.string :uid, null:false

      # :ready, :pending, :assemble, :cancelled, :shipped
      t.string :state, null:false, limit:16

      t.decimal :cost, precision: 12, scale: 2, null:false

      t.datetime :shipped_at

      t.belongs_to :shop_order, foreign_key: true
      t.belongs_to :shop_shipping_method, foreign_key: true


      t.timestamps
    end
    add_index :shop_shipments, :uid, unique: true
  end
end
