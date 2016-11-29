RSpec.shared_context "ItemHolder interface" do
  it "responds to #items" do
    object.respond_to? :items
  end
end
