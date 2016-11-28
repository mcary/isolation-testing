class Cart
  def empty?
    @items.empty?
  end

  def add(item)
    @items ||= []
    @items.push item
  end
end
