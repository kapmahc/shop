class CreateShopOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_orders do |t|
      t.string :uid, null:false, limit: 36
      t.integer :state, null:false

      t.monetize :item_total
      t.monetize :total
      t.monetize :adjustment_total
      t.monetize :payment_total

      t.belongs_to :user, foreign_key: true
      t.belongs_to :shop_address, foreign_key: true

      t.datetime :completed_at
      t.timestamps
    end
    add_index :shop_orders, :uid, unique: true
  end
end
