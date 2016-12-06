require_relative "../lib/cart_view"
require_relative "../lib/item"
require_relative "support/cart_view_cart_stub"
require_relative "support/cart_item_view_stub"

RSpec.describe CartView do
  let (:cart_item_view_stub) { CartItemViewStub.new }

  it "renders" do
    item_stub = Object.new
    cart_stub = CartViewCartStub.new(15, false, [item_stub])
    result = CartView.new.render(cart_stub, cart_item_view_stub)
    expect(result).to eq %{
      Cart price: $15

      Items:
      [stubbed]
    }.sub(/^\n/, '').gsub(/^ {,6}/, '')
    expect(cart_item_view_stub.item).to be item_stub
  end

  it "renders empty specially" do
    cart = CartViewCartStub.new(0, true, [])
    result = CartView.new.render(cart, cart_item_view_stub)
    expect(result).to eq %{
      Cart is empty
    }.sub(/^\n/, '').gsub(/^ {,6}/, '')
  end
end

