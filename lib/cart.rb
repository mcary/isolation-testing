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
end
