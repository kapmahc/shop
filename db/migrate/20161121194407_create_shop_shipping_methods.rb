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
  end
end
