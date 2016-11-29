class Order
  def self.place(cart)
    self.new(cart.items)
  end

  def initialize(items)
    @items = items.dup
    @payments = []
  end

  def amount_due
    @items.inject(0) { |sum, item| sum + item.price }
  end

  def accept_payment(amount)
    @payments.push amount
  end

  def paid?
    amount_due <= @payments.inject(0) { |sum, amt| sum + amt }
  end
end
