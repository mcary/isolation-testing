require_relative "support/cart_item_view_interface"
require_relative "support/cart_item_view_stub"

RSpec.describe CartItemViewStub do
  let(:object) do
    CartItemViewStub.new
  end
  include_context "CartItemView interface"
end

