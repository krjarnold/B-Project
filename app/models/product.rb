class Product < ActiveRecord::Base

  validates :product_name, :product_image, presence: true

  has_many :inventories,
    class_name: "Inventory",
    foreign_key: :product_id,
    primary_key: :id

end
