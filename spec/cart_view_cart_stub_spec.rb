require_relative "support/cart_view_cart_interface"
require_relative "support/cart_view_cart_stub"

RSpec.describe CartViewCartStub do
  let(:object) do
    CartViewCartStub.new(
      20, true,
      [],
    )
  end
  include_context "CartView Cart interface"
end
