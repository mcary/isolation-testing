require_relative "../lib/cart"

RSpec.describe Cart do
  it "can be empty" do
    cart = Cart.new
    expect(cart.empty?).to be true
  end

  it "can have items added to it" do
    cart = Cart.new
    cart.add(Object.new)
  end
end
