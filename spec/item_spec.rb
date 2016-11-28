require_relative "../lib/item"

RSpec.describe Item do
  let(:item) { Item.new("Test item", 10) }

  it "has a name" do
    expect(item.name).to eq "Test item"
  end

  it "has a price" do
    expect(item.price).to eq 10
  end
end
