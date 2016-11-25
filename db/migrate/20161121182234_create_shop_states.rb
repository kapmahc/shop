class CreateShopStates < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_states do |t|
      t.string :name, null: false, edit: true
      t.belongs_to :shop_country, foreign_key: true

      t.timestamps
    end

    add_index :shop_states, [:name, :shop_country_id], unique: true
  end
end
