require_relative "priceable_interface"

RSpec.shared_context "CartView Item interface" do
  include_context "Priceable interface"

  it "responds to #name with a String" do
    expect(object.name).to be_a String
  end
end
