require_relative "../lib/cart_item_view"
require_relative "support/cart_item_view_interface"
require_relative "support/cart_view_item_stub"

RSpec.describe CartItemView do
  let(:object) { view }
  include_context "CartItemView interface"

  let(:view) { CartItemView.new }

  it "renders name and price" do
    item_stub = CartViewItemStub.new(10, "Foo")
    expect(view.render(item_stub)).to eq "* Foo ($10)\n"
  end
end
