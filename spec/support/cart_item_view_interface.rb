RSpec.shared_context "CartItemView interface" do
  it "responds to #render with a string" do
    item = CartViewItemStub.new(10, "Foo")
    expect(object.render(item)).to be_a String
  end
end

