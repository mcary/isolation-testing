require_relative "../lib/order"
require_relative "../lib/cart"
require_relative "../lib/item"

RSpec.describe Order do
  it "can be placed from a cart" do
    cart = Cart.new
    cart.add(Item.new("Foo", 10))
    order = Order.place(cart)
    expect(order.amount_due).to eq 10
  end
end
