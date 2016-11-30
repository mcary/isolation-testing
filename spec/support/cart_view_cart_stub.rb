class CartViewCartStub < Struct.new(:total_price, :empty, :items)
  alias :empty? :empty
end
