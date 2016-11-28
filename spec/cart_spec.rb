require_relative "../lib/cart"

RSpec.describe Cart do
  it "can be empty" do
    cart = Cart.new
    expect(cart.empty?).to be true
  end
end
