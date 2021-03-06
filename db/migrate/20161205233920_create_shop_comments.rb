class CreateShopComments < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_comments do |t|
      t.text :body, null:false
      t.integer :point, null:false

      t.belongs_to :shop_product, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
