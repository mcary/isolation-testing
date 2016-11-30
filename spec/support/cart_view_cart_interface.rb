require_relative "item_holder_interface"

RSpec.shared_context "CartView Cart interface" do
  include_context "ItemHolder interface"

  it "responds to #total_price with an number" do
    expect(object.total_price).to be_a Numeric
  end

  it "responds to #empty? with an boolean" do
    expect([true, false]).to include(object.empty?)
  end
end

