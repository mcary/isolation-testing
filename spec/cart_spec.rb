require_relative "../lib/cart"

RSpec.describe Cart do
  it "can be empty" do
    cart = Cart.new
    expect(cart.empty?).to be true
  end

  it "can have items added to it" do
    cart = Cart.new
    cart.add(Object.new)
    expect(cart.empty?).to be false
  end

  it "changes empty? when adding items" do
    cart = Cart.new
    expect {
      cart.add(Object.new)
    }.to change {
      cart.empty?
    }.from(true).to(false)
  end
end
