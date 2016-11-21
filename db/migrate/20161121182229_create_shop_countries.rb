class CreateShopCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_countries do |t|
      t.string :name, null: false
      t.boolean :active, null: false, default: false

      t.timestamps
    end
    add_index :shop_countries, :name, unique: true
  end
end
