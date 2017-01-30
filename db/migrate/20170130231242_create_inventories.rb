class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :product_id, null: false
      t.string :waist, null: false
      t.string :length, null: false
      t.string :style, null: false
      t.integer :count, null: false
      t.timestamps null: false
    end

    add_index :inventories, :product_id
  end
end
