class CreateShopCurrencies < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_currencies do |t|
      t.string :cid, null: false, limit:3, edit: true
      t.string :code, null: false, limit:3, edit: true
      t.string :name, null: false, edit: true
      t.string :country, null: false, edit: true
      t.string :units, null: false, limit:8

      t.timestamps
    end
  end
end
