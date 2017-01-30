class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :product_id, null: false
      t.string :product_name, null: false
      t.string :product_image, null: false
      t.timestamps
    end

    add_index :products, :product_id
  end
end
