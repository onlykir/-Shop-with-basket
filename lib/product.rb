class Product
  attr_accessor :price, :amount

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  def info
  end

  def to_s
    "#{@price} руб. (осталось #{@amount})"
  end

  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end

  def self.from_file(file_path)
    raise NotImplementedError
  end

  def self.show_products(products)
    puts "Что хотите купить?\n\n"

    products.to_a.each.with_index(1) do |product, index|
      puts "#{index}: #{product}"
    end

    puts "0. Выход\n\n"
  end

  def buy
    if @amount > 0
      puts "* * *"
      puts "Вы купили товар #{info}"
      puts "* * *\n\n"

      @amount -= 1
      price
    else
      puts "* * *"
      puts "К сожалению, больше такого товара на складе нет"
      puts "* * *\n\n"
      0
    end
  end

end
