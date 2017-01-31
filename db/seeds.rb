# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.destroy_all
Inventory.destroy_all

Product.create!(product_id: 1, product_name: "Pants", product_image: "Image of some pants")
Product.create!(product_id: 2, product_name: "Shirts", product_image: "Image of some shirts")

Inventory.create!(product_id: 1, waist: 28, length: 30, style: "chino", count: 3)
Inventory.create!(product_id: 1, waist: 28, length: 32, style: "jeans", count: 4)
Inventory.create!(product_id: 2, waist: 30, length: 34, style: "khakis", count: 5)
Inventory.create!(product_id: 2, waist: 30, length: 36, style: "workout", count: 6)
Inventory.create!(product_id: 2, waist: 30, length: 38, style: "shorts", count: 7)
