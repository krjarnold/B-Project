require 'csv'

Product.destroy_all
Inventory.destroy_all


#Custom upload for the Product CSV file since it kept throwing illegal quoting errors
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

#Normal CSV process for Inventory file

CSV.foreach(Rails.root.join('lib', 'seeds', 'inventory.csv')) do |row|
   t= Inventory.new
   t.product_id = row[0]
   t.waist = row[1]
   t.length = row[2]
   t.style = row[3].titleize.strip
   t.count = row[4]
   t.save!
end
