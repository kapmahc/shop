class CreateShopReturnAuthorizations < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_return_authorizations do |t|
      t.string :tracking, null:false
      t.string :uid, null:false

      t.integer :state, null:false

      t.monetize :amount
      t.text :reason, null:false

      t.integer :enter_by
      t.datetime :enter_at

      t.belongs_to :shop_order, foreign_key: true
      t.belongs_to :shop_shipping_method, foreign_key: true

      t.timestamps
    end
  end
end
