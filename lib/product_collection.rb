class ProductCollection

  PRODUCT_TYPES = {
    film: {dir: "films", class: Film},
    book: {dir: "books", class: Book},
    disk: {dir: "disks", class: Disk}
  }

  def initialize(products = [])
    @products = products
  end

  def to_a
    @products
  end

  def add(product)
    @products << product
  end

  def show
    @products.to_a.map { |product| product.info }
  end

  def self.from_dir(dir_path)
    products = []

    PRODUCT_TYPES.each do |type, hash|
      product_dir = hash[:dir]
      product_class = hash[:class]

      Dir[dir_path + "/" + product_dir + "/*.txt"].each do |path|
        products << product_class.from_file(path)
      end
    end

    self.new(products)
  end

  def sort!(params)
    case params[:by]
    when :title
      @products.sort_by!(&:to_s)
    when :price
      @products.sort_by!(&:price)
    when :amount
      @products.sort_by!(&:amount.to_s)
    end

    @products.reverse! if params[:order] == :asc

    self
  end
end
