class CreateShopShippingMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_shipping_methods do |t|
      t.string :name, null: false
      t.string :tracking, null:false
      t.text :description
      t.text :encrypted_profile
      t.string :encrypted_profile_iv
      t.boolean :active, null: false, default: false

      t.timestamps
    end

    add_index :shop_shipping_methods, :name, unique: true

    create_table :shop_shipping_methods_countries, id: false do |t|
      t.belongs_to :shop_shipping_method, foreign_key: true, index: {:name => 'idx_shop_shipping_methods_countries_s'}
      t.belongs_to :shop_country, foreign_key: true, index: {:name => 'idx_shop_shipping_methods_countries_c'}
    end

    add_index :shop_shipping_methods_countries, [:shop_shipping_method_id, :shop_country_id], name: 'idx_shop_shipping_methods_countries', unique:true

  end
end
