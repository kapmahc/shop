class CreateShopLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_line_items do |t|
      t.integer :quantity, null:false
      t.money :price

      t.belongs_to :shop_variant, foreign_key: true
      t.belongs_to :shop_order, foreign_key: true

      t.timestamps
    end
  end
end
