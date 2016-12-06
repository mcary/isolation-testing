class CartItemViewStub
  attr_reader :item

  def render(item)
    # Save for later verification
    self.item = item
    "[stubbed]\n"
  end

  private

  attr_writer :item
end
