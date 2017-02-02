class ChangeProducts < ActiveRecord::Migration
  def change
    change_table  :products do |t|
      t.remove :product_id
      t.text :description
    end
  end
end
