class CreateShopProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_properties do |t|
      t.text :value, null:false

      t.belongs_to :shop_variant, foreign_key: true
      t.belongs_to :shop_property_field, foreign_key: true
      t.timestamps
    end

    add_index :shop_properties, [:shop_variant_id, :shop_property_field_id], name:'idx_shop_properties', unique: true


  end
end
