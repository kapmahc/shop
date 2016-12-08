class CreateShopOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_orders do |t|
      t.string :uid, null:false, limit: 36

      # :cart, :address, :delivery, :payment, :confirm, :complete
      t.string :state, null:false, limit: 8, index:true

      # :ready, :pending, :partial, :shipped, :backorder, :canceled
      t.string :shipment_state, null:false, limit: 8, index:true

      # :balance_due, :paid, :credit_owed, :failed, :void
      t.string :payment_state, null:false, limit: 8, index:true

      t.string :address, null:false

      t.monetize :item_total
      t.monetize :total
      t.monetize :adjustment_total
      t.monetize :payment_total

      t.belongs_to :user, foreign_key: true

      t.datetime :completed_at
      t.timestamps
    end
    add_index :shop_orders, :uid, unique: true
  end
end
