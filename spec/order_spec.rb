require_relative "../lib/order"
require_relative "support/priceable_stub"
require_relative "support/item_holder_stub"

RSpec.describe Order do
  it "can be placed from a cart" do
    items = [PriceableStub.new(10)]
    item_holder = ItemHolderStub.new(items)
    order = Order.place(item_holder)
    expect(order.amount_due).to eq 10
  end

  it "keeps a private copy of items" do
    items = []
    item_holder = ItemHolderStub.new(items)
    order = Order.place(item_holder)
    items.push PriceableStub.new(10)
    expect(order.amount_due).to eq 0
  end
end
