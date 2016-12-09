class CreateShopTagHierarchies < ActiveRecord::Migration
  def change
    create_table :shop_tag_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :shop_tag_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: 'shop_tag_anc_desc_idx'

    add_index :shop_tag_hierarchies, [:descendant_id],
      name: 'shop_tag_desc_idx'
  end
end
