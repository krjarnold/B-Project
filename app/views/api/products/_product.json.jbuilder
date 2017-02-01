json.extract! product, :product_id, :product_name, :product_image, :description

json.inventory product.inventories do |inventory|
  json.partial! "api/inventories/inventory.json.jbuilder", inventory: inventory
end
