class Order
  def self.place(cart)
    self.new(cart.items)
  end

  def initialize(items)
    @items = items.dup
  end

  def amount_due
    @items.inject(0) { |sum, item| sum + item.price }
  end
end
