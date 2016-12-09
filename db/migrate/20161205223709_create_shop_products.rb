class CreateShopProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_products do |t|
      t.string :name, null:false, index: true
      t.text :description, null: false
      t.timestamps
    end
  end
end
