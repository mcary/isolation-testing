require_relative "support/item_holder_stub"
require_relative "support/item_holder_interface"

RSpec.describe ItemHolderStub do
  let(:object) { ItemHolderStub.new([]) }
  include_context "ItemHolder interface"
end

