class SupplyStack
  attr_reader :stack
  def initialize
    @stack = []
  end

  def load_stack(new_stack)
    new_stack.each do |arr|
      @stack << arr
    end
  end
end
