class CreateShopChargebacks < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_chargebacks do |t|

      t.string :state, limit:16, index:true, null:false
      t.decimal :amount, precision: 12, scale: 2, null:false
      t.integer :operator_id

      t.belongs_to :shop_order, foreign_key: true


      t.timestamps
    end
  end
end
