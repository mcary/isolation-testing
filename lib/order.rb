class Order
  def self.place(cart)
    self.new(cart.items)
  end

  def initialize(items)
    @items = items.dup
    @payments = []
  end

  def amount_due
    total_price - total_paid
  end

  def accept_payment(amount)
    @payments.push amount
  end

  def paid?
    amount_due <= 0
  end

  private

  def total_price
    sum(@items.map(&:price))
  end

  def total_paid
    sum(@payments)
  end

  def sum(array)
    array.inject(0) { |sum, amt| sum + amt }
  end
end
