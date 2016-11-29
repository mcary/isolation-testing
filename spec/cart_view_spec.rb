require_relative "../lib/cart_view"

RSpec.describe CartView do
  it "renders" do
    result = CartView.new.render
    expect(result).to eq "Cart\n"
  end
end

