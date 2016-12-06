class CreateShopTags < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_tags do |t|
      t.string :name, null:false, index:true
      t.integer :parent_id
      t.integer :sort_order, null:false
      t.timestamps
    end

    create_table :shop_products_tags, id: false do |t|
      t.belongs_to :shop_product, foreign_key: true
      t.belongs_to :shop_tag, foreign_key: true
    end

    add_index :shop_products_tags, [:shop_product_id, :shop_tag_id], name: 'idx_shop_products_tags', unique:true

  end
end
