RSpec.shared_context "ItemHolder interface" do
  it "responds to #items" do
    object.respond_to? :items
  end

  it "responds to #items with an array" do
    expect(object.items).to be_a Array
  end
end
