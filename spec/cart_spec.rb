require_relative "../lib/cart"

RSpec.describe Cart do
  let(:cart) { Cart.new }

  it "can be empty" do
    expect(cart.empty?).to be true
  end

  it "can have items added to it" do
    cart.add(Object.new)
    expect(cart.empty?).to be false
  end

  it "changes empty? when adding items" do
    expect {
      cart.add(Object.new)
    }.to change {
      cart.empty?
    }.from(true).to(false)
  end
end
