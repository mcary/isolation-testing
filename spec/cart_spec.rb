require_relative "../lib/cart"

RSpec.describe Cart do
  it "can be constructed" do
    cart = Cart.new
  end

  it "can be empty" do
    cart = Cart.new
    expect(cart.empty?).to be true
  end
end
