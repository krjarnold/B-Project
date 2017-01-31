class Inventory < ActiveRecord::Base
  validates :product_id, :waist, :length, :style, :count, presence: true


  belongs_to :product,
    class_name: "Product",
    foreign_key: :product_id,
    primary_key: :id


end
