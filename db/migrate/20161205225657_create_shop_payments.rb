class CreateShopPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_payments do |t|

      t.integer :state, null:false
      t.string :response_code
      t.string :avs_response

      t.monetize :amount

      t.belongs_to :shop_order, foreign_key: true
      t.belongs_to :shop_payment_method, foreign_key: true

      t.timestamps
    end
  end
end
