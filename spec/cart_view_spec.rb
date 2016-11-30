require_relative "../lib/cart_view"
require_relative "../lib/item"
require_relative "support/cart_view_cart_stub"
require_relative "support/cart_view_item_stub"

RSpec.describe CartView do
  it "renders" do
    cart_stub = CartViewCartStub.new(
      15, false,
      [
        CartViewItemStub.new(10, "Foo"),
        CartViewItemStub.new(5, "Bar"),
      ],
    )
    result = CartView.new.render(cart_stub)
    expect(result).to eq %{
      Cart price: $15

      Items:
      * Foo ($10)
      * Bar ($5)
    }.sub(/^\n/, '').gsub(/^ {,6}/, '')
  end

  it "renders empty specially" do
    cart = CartViewCartStub.new(0, true, [])
    result = CartView.new.render(cart)
    expect(result).to eq %{
      Cart is empty
    }.sub(/^\n/, '').gsub(/^ {,6}/, '')
  end
end

