class CreateShopVariants < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_variants do |t|

      t.string :sku, null:false, limit: 36
      t.decimal :price, precision: 12, scale: 2, null:false
      t.decimal :cost_price, precision: 12, scale: 2
      t.decimal :weight, precision: 12, scale: 2
      t.decimal :height, precision: 12, scale: 2
      t.decimal :width, precision: 12, scale: 2
      t.decimal :length, precision: 12, scale: 2


      t.belongs_to :shop_product, foreign_key: true

      t.timestamps
    end
    add_index :shop_variants, :sku, unique: true
  end
end
