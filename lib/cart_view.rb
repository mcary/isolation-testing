class CartView
  def initialize
    @erb = ERB.new(File.read(file_name), nil, "<>")
  end

  def render(cart)
    @erb.result(binding)
  end

  private

  def file_name
    File.expand_path("cart_view.erb", File.dirname(__FILE__))
  end
end
