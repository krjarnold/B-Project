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

product_file = File.path(Rails.root.join('lib', 'seeds', 'products.csv'))
new_file = File.new(product_file, 'r')

file2 = []
new_file.each_line("\n") do |row|
  file2 << [row]
end

new_entries = []
file2.each_with_index do |row, i|
  next if i == 0
  parse_entry = row[0].split(",")
  if parse_entry.length > 3
    parse_entry[3] = parse_entry[3..-1].join(",")
  end
  new_entries << parse_entry[0..3]
end

new_entries.each do |row|
  a = CSV.parse_line(row[0])
  b = CSV.parse_line(row[1])
  c = row[2].gsub('"',"")
  d = row[3].gsub('"',"")
  t = Product.new
  t.product_id = a[0].to_i
  t.product_name = b[0].titleize
  t.product_image = c
  t.description = d
  t.save!
end
# debugger

# product_file = File.read(Rails.root.join('lib', 'seeds', 'products.csv'))
# tester = CSV.parse_line(product_file)
# debugger
# parsed = CSV.parse(product_file.)

# csv_text = open('https://github.com/bonobos/fullstack_homework/blob/master/inventory.csv')
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#   puts row
# end


# parsed = CSV.parse(product_file.gsub('"', ''))
# parsed.each_with_index do |row, i|
#   next if i == 0
#   t = Product.new
#   t.product_id = row[0]
#   t.product_name = row[1].titleize
#   t.product_image = row[2]
#   t.description = row[3].gsub("+", ",")
#   t.save!
# end

# debugger
# CSV.foreach(product_file.gsub('"', '')) do |row|
#   Product.create(row.to_hash)
# end

# CSV.foreach(Rails.root.join('lib', 'seeds', 'products.csv'), quote_char: => "\x00") do |row|
#   Product.create(row.to_hash)
# end


# columns = [:product_id, :product_name, :product_image, :product_description]
# values = CSV.read(Rails.root.join('lib', 'seeds', 'products.csv'))
#
# Product.import columns, values

# product_file = File.path(Rails.root.join('lib', 'seeds', 'products.csv'))
# CSV.foreach(product_file) do |row|
#   t = Product.new
#   t.product_id = row[0]
#   t.product_name = row[1].titleize
#   t.product_image = row[2]
#   t.description = row[3]
#   t.save!
# end


CSV.foreach(Rails.root.join('lib', 'seeds', 'inventory.csv')) do |row|
   t= Inventory.new
   t.product_id = row[0]
   t.waist = row[1]
   t.length = row[2]
   t.style = row[3].titleize.strip
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
