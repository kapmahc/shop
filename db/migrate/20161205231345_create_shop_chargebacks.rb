class CreateShopChargebacks < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_chargebacks do |t|

      t.integer :state, null:false
      t.monetize :amount
      t.integer :operator_id

      t.belongs_to :shop_order, foreign_key: true


      t.timestamps
    end
  end
end
