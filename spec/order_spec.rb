require_relative "../lib/order"

RSpec.describe Order do
  it "can be placed from a cart" do
    order = Order.place(Object.new)
    expect(order).to be_instance_of Order
  end
end
