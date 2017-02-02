require 'csv'
require 'open-uri'
require 'byebug'
require 'smarter_csv'

# csv_text = open('https://github.com/bonobos/fullstack_homework/blob/master/inventory.csv')
#
# csv_text.each_line("\n") do |row|
#   puts row
# end

# print "he\\\l""lo".delete("\\")
# print "k""""l".gsub('""',"")
product_file = "./lib/seeds/products.csv"

new_file = File.new(product_file, 'r')

testing2 = []
new_file.each_line("\n") do |row|
  testing2 << [row]
end
# debugger
# puts testing2

new_entries = []
testing2.each_with_index do |row, i|
  next if i == 0
  parse_entry = row[0].split(",")
  if parse_entry.length > 3
    parse_entry[3] = parse_entry[3..-1].join(",")
  end
  new_entries << parse_entry[0..3]
end


new_entries.each do |row|
  a = CSV.parse_line(row[0])
  puts a
  b = CSV.parse_line(row[1])
  puts b
  c = row[2]
  # c = CSV.parse_line(row[2])
  puts "=---"
  print c.gsub('"',"")
  d = row[3].gsub('"',"")
  puts "=---"

  # d = CSV.parse_line(row[3])
  puts d

  # t = Product.new
  # t.product_id = row[0].gsub('""',"").delete("\\")
  # t.product_name = row[1].gsub('""',"")
  # t.product_image = row[2].gsub('""',"")
  # t.description = row[3].gsub('""',"")
  # t.save!
  # debugger
end


# csv = CSV.parse_line(csv_text, :headers => true)
# debugger
# csv.each do |row|
#   debugger
#   puts row
# end
