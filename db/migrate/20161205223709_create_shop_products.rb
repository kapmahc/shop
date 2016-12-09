class CreateShopProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_products do |t|
      t.string :name, null:false, index: true
      t.text :description, null: false
      t.integer :latest_order, null:false, default:0
      t.integer :hot_order, null:false, default:0
      t.timestamps
    end
  end
end
