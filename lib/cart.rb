class Cart
  def initialize
    @items = []
  end

  def empty?
    @items.empty?
  end

  def add(item)
    @items.push item
  end

  def total_price
    @items.inject(0) { |sum, item| sum + item.price }
  end
end
