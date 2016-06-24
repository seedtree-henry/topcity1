require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "


# For each product in the data set:
products_hash["items"].each do |toy|
  # Print the name of the toy
  puts toy["title"]
  # Print the retail price of the toy
  puts "Retail price: $" +  toy["full-price"].to_s
  # Calculate and print the total number of purchases
  puts "Total purchases: " + toy["purchases"].length.to_s
  # Calculate and print the total amount of sales
  total_sales = 0.0
  toy["purchases"].each do |p|
    total_sales =  total_sales + p["price"]
  end
  puts "Total sales: $" +  total_sales.to_s
  # Calculate and print the average price the toy sold for
  average_sales = total_sales / 2
  puts "Average price: $" +  average_sales.round(2).to_s
  # Calculate and print the average discount (% or $) based off the average sales price
  average_discount = toy["full-price"].to_f - average_sales
  puts "Average discount: $" + average_discount.round(2).to_s 
  discount_rate = (toy["full-price"].to_f-average_sales)/toy["full-price"].to_f*100 
  puts discount_rate.round(2).to_s  + "%"
  puts " "
end

puts " _                         _     "
puts "| |                       | |    "
puts "| |__  _ __ __ _ _ __   __| |___ "
puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
puts "| |_) | | | (_| | | | | (_| \\__ \\"
puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
puts ""

# For each brand in the data set:
brands = [ ]
products_hash["items"].each do |toy|
  brands.push(toy["brand"])
end

brands = brands.uniq
  # Print the name of the brand
brands.each do |b|
  puts b
  total_stock = 0
  total_price = 0.0
  average_price = 0.0
  total_sales = 0.0
  n = 0
  products_hash["items"].each do |toy|
    if toy["brand"] == b
      n = n + 1
      total_stock = total_stock + toy["stock"]
      total_price = total_price + toy["full-price"].to_f
      toy["purchases"].each do |p|
        total_sales = total_sales + p["price"]
      end
    end  
  end
  # Count and print the number of the brand's toys we stock
  puts "Number of stocks: " + total_stock.to_s
  # Calculate and print the average price of the brand's toys
  average_price = total_price / n
  puts "Average price: $" +  average_price.round(2).to_s
  # Calculate and print the total revenue of all the brand's toy sales combined
  puts "Total sales: " + total_sales.round(2).to_s
  puts " "
end

