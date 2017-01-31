class Product < ActiveRecord::Base

  validates :product_id, :product_name, :product_image, presence: true

  has_one :inventory,
    class_name: "Inventory",
    foreign_key: :product_id,
    primary_key: :product_id

end
