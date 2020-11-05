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

  def any_in_store?
    @amount.positive?
  end

  def buy
    return 0 unless any_in_store?
    @amount -= 1
    price
  end
end
