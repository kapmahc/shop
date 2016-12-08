class CreateShopPropertyFields < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_property_fields do |t|
      t.string :name, null:false, index:true
      t.string :lang, null:false, index:true
      t.string :flag, null:false, index:true, default: 'text'
      t.integer :sort_order, null:false
      t.text :profile

      t.timestamps
    end
    add_index :shop_property_fields, [:lang, :name], unique:true
  end
end
