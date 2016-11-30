require_relative "support/cart_view_item_stub"
require_relative "support/cart_view_item_interface"

RSpec.describe CartViewItemStub do
  let(:object) { CartViewItemStub.new(10, "Foo") }
  include_context "CartView Item interface"
end
