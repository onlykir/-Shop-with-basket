require_relative "lib/product"
require_relative "lib/book"
require_relative "lib/film"
require_relative "lib/disk"

require_relative "lib/product_collection"

total_price = 0

collection = ProductCollection.from_dir(File.dirname(__FILE__) + "/data")
collection.sort!(by: :price, order: :asc)

user_input = nil
user_purchases = ProductCollection.new # Покупки пользователя

while user_input != "0"
  Product.show_products(collection)

  user_input = STDIN.gets.strip

  if user_input != "0" && user_input.to_i <= collection.to_a.size && user_input.to_i >= 0
    product = collection.to_a[user_input.to_i - 1]
    total_price += product.buy # Увеличиваем стоимость
    user_purchases.add(product) # Добавляем товар корзину
  end
end

puts "Вы купили:\n"
puts user_purchases.show
puts "\nСпасибо за покупки, с Вас #{total_price} руб."
