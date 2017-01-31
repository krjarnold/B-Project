class ChangeInventories < ActiveRecord::Migration
  def change
    change_table  :inventories do |t|
      t.remove :waist, :length
      t.integer :waist, null: false
      t.integer :length, null: false
    end
  end
end
