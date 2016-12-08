class CreateShopProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_properties do |t|
      t.string :key, null:false, index: true
      t.text :value, null:false

      t.belongs_to :shop_variant, foreign_key: true

      t.timestamps
    end
    add_index :shop_properties, [:key, :shop_variant_id], unique: true
  end
end
