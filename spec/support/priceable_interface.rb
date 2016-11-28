RSpec.shared_context "Priceable interface" do
  it "responds to #price" do
    object.respond_to? :price
  end
end
