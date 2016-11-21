class CreateShopCurrencies < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_currencies do |t|
      t.string :cid, null: false, limit:3, index: true
      t.string :code, null: false, limit:3, index: true
      t.string :name, null: false, index: true
      t.string :country, null: false, index: true
      t.decimal :rate, precision: 12, scale: 4
      t.string :units, null: false, limit:8
      t.boolean :active, null: false, default: false
      t.timestamps
    end
  end
end
