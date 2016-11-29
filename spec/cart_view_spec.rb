require_relative "../lib/cart_view"
require_relative "../lib/cart"
require_relative "../lib/item"

RSpec.describe CartView do
  it "renders" do
    cart = Cart.new
    cart.add(Item.new("Foo", 10))
    cart.add(Item.new("Bar", 5))
    result = CartView.new.render(cart)
    expect(result).to eq %{
      Cart price: $15

      Items:
      * Foo ($10)
      * Bar ($5)
    }.sub(/^\n/, '').gsub(/^ {,6}/, '')
  end
end

