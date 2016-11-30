require_relative "../lib/cart"
require_relative "support/priceable_stub"
require_relative "support/item_holder_interface"
require_relative "support/cart_view_cart_interface"

RSpec.describe Cart do
  let(:object) { cart }
  include_context "ItemHolder interface"
  include_context "CartView Cart interface"

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

  it "computes total price" do
    cart.add(PriceableStub.new(10))
    expect(cart.total_price).to eq 10
  end

  it "keeps items private" do
    # Ensure mutations to cart.items will not change the cart.
    items = cart.items
    items.push Object.new
    expect(cart.empty?).to be true
  end
end
