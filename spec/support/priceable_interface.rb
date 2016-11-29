RSpec.shared_context "Priceable interface" do
  it "responds to #price" do
    object.respond_to? :price
  end

  it "returns the expected number from #price" do
    expect(object.price).to eq 10
  end
end
