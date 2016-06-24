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
  puts toy["full-price"]
  # Calculate and print the total number of purchases
  puts toy["purchases"].length
  # Calculate and print the total amount of sales
  total_toys = 0.0
  total_shipping = 0.0
  total_sales = 0.0
  toy["purchases"].each do |p|
    total_toys =  total_toys + p["price"] 
    total_shipping =  total_shipping + p["shipping"]
  end
  total_sales = total_toys + total_shipping
  puts total_sales
  # Calculate and print the average price the toy sold for
  average_toy = total_toys / 2
  puts average_toy
  # Calculate and print the average discount (% or $) based off the average sales price
  discount_rate = (toy["full-price"].to_f-average_toy)/average_toy*100 
  puts discount_rate.round(2).to_s  + "%"
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
  products_hash["items"].each do |toy|
    if toy["brand"] == b
      total_stock = total_stock + toy["stock"]
      total_price = total_price + toy["full-price"].to_f
    end  
  end
  # Count and print the number of the brand's toys we stock
  puts total_stock
  # Calculate and print the average price of the brand's toys
  average_price = total_price / 2
  puts average_price.round(2)
end

  # Calculate and print the total revenue of all the brand's toy sales combined
gross_sales = 0.0
gross_toys = 0.0
gross_shipping = 0.0
products_hash["items"].each do |toy|
  toy["purchases"].each do |p|
    gross_toys = gross_toys + p["price"]
    gross_shipping = gross_shipping + p["shipping"]
  end
end
gross_sales = gross_toys + gross_shipping
puts "gross sales: " +  gross_sales.to_s
