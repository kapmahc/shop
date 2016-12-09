require 'money-rails'

class CreateShopVariants < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_variants do |t|
      t.string :name, null:false, index:true
      t.string :sku, null:false, limit: 36
      t.monetize :price
      t.monetize :cost_price
      t.decimal :weight, precision: 12, scale: 2
      t.decimal :height, precision: 12, scale: 2
      t.decimal :width, precision: 12, scale: 2
      t.decimal :length, precision: 12, scale: 2
      t.string :state, null:false, limit: 16, index:true

      t.belongs_to :shop_product, foreign_key: true

      t.timestamps
    end
    add_index :shop_variants, :sku, unique: true

  end
end
