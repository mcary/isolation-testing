require_relative "support/priceable_stub"
require_relative "support/priceable_interface"

RSpec.describe PriceableStub do
  let(:object) { PriceableStub.new(10) }
  include_context "Priceable interface"
end
