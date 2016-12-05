class CreateShopCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_countries do |t|
      t.string :name, null: false
      t.string :alpha_2, null: false, index: true, limit: 2
      t.string :alpha_3, null: false, index: true, limit: 3
      t.string :code, null: false, index: true, limit: 3
      t.string :iso3166_2, null: false, index: true, limit: 16
      t.string :region, null: false, index: true, limit: 16
      t.string :sub_region, null: false, index: true, limit: 32
      t.string :region_code, null: false, index: true, limit: 3
      t.string :sub_region_code, null: false, index: true, limit: 3

      t.boolean :active, null: false, default: false

      t.timestamps
    end
    add_index :shop_countries, :name, unique: true
  end
end
