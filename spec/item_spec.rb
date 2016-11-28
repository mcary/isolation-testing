require_relative "../lib/item"
require_relative "support/priceable_interface"

RSpec.describe Item do
  let(:object) { item }
  include_context "Priceable interface"

  let(:item) { Item.new("Test item", 10) }

  it "has a name" do
    expect(item.name).to eq "Test item"
  end

  it "has a price" do
    expect(item.price).to eq 10
  end
end
