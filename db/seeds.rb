require "csv"

filepath = "storage/items.csv"

CSV.foreach(filepath, headers: :first_row) do |row|
  Item.new(name: row[0], desc: row[1], way: row[2], price: 0)
end
