class CreateShopAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_addresses do |t|
      t.string :full_name, null:false, index: true
      t.string :content, null: false, index: true
      t.string :phone, null:false, index:true
      t.string :zip_code, null:false, limit: 8, index: true
      t.string :country_code, null:false, index:true, limit:3

      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
