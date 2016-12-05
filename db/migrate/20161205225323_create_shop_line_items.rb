class CreateShopLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_line_items do |t|
      t.integer :quantity, null:false
      t.decimal :price, precision: 12, scale: 2, null:false

      t.belongs_to :shop_variant, foreign_key: true
      t.belongs_to :shop_order, foreign_key: true

      t.timestamps
    end
  end
end
