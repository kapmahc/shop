class CreateShopTags < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_tags do |t|
      t.string :name, null:false, index:true
      t.integer :parent_id
      t.integer :sort_order, null:false
      t.timestamps
    end

    create_table :shop_products_tags, id: false do |t|
      t.belongs_to :shop_products, foreign_key: true
      t.belongs_to :shop_tags, foreign_key: true
    end

    add_index :shop_products_tags, [:shop_products_id, :shop_tags_id], name: 'idx_shop_products_tags', unique:true

  end
end
