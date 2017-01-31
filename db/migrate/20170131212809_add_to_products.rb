class AddToProducts < ActiveRecord::Migration
  def change
    change_table  :products do |t|
      t.integer :product_id
    end
  end
end
