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

  it "accepts payment" do
    order = Order.new([PriceableStub.new(10)])
    expect {
      order.accept_payment(10)
    }.to change {
      order.paid?
    }.from(false).to(true)
  end

  it "accepts payment" do
    order = Order.new([PriceableStub.new(10)])
    expect(order.paid?).to be false
    order.accept_payment(5)
    expect(order.paid?).to be false
    expect(order.amount_due).to eq 5
  end
end
