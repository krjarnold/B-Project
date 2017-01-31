# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

Product.destroy_all
Inventory.destroy_all

product_file = File.read(Rails.root.join('lib', 'seeds', 'products.csv'))
parsed = CSV.parse(product_file.gsub('"', ''))
# debugger
# CSV.foreach(product_file.gsub('"', '')) do |row|
#   Product.create(row.to_hash)
# end
# CSV.foreach(Rails.root.join('lib', 'seeds', 'products.csv')) do |row|
#   Product.create(row.to_hash)
# end


# columns = [:product_id, :product_name, :product_image, :product_description]
# values = CSV.read(Rails.root.join('lib', 'seeds', 'products.csv'))
#
# Product.import columns, values

# product_file = File.read(Rails.root.join('lib', 'seeds', 'products.csv'))
# csv = CSV.parse(product_file, :headers => true, :encoding => 'ISO-8859-1')
parsed.each do |row|
  t = Product.new
  t.product_id = row[0]
  t.product_name = row[1]
  t.product_image = row[2]
  t.description = row[3]
  t.save!
end

CSV.foreach(Rails.root.join('lib', 'seeds', 'inventory.csv')) do |row|
  t= Inventory.new
  t.product_id = row[0]
   t.waist = row[1]
   t.length = row[2]
   t.style = row[3]
   t.count = row[4]
   t.save!
end

#
# inventory_file = File.read(Rails.root.join('lib', 'seeds', 'inventory.csv'))
# csv2 = CSV.parse(inventory_file, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   t = Inventory.new
#   t.product_id = row['product_id']
#   t.waist = row['waist']
#   t.length = row['length']
#   t.style = row['style']
#   t.count = row['count']
# end

# Product.destroy_all
# Inventory.destroy_all
#
# Product.create!(product_name: "Pants", product_image: "Image of some pants", description: "These pants are awesome")
# Product.create!(product_name: "Shirts", product_image: "Image of some shirts", description: "I love this shirt")
#
# Inventory.create!(product_id: 1, waist: 28, length: 30, style: "chino", count: 3)
# Inventory.create!(product_id: 1, waist: 28, length: 32, style: "jeans", count: 4)
# Inventory.create!(product_id: 2, waist: 30, length: 34, style: "khakis", count: 5)
# Inventory.create!(product_id: 2, waist: 30, length: 36, style: "workout", count: 6)
# Inventory.create!(product_id: 2, waist: 30, length: 38, style: "shorts", count: 7)
