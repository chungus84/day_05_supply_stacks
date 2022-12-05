require 'supply_stack'

describe SupplyStack do
  describe '.load_stack' do
    new_stack = SupplyStack.new
    test_stack = [['Z', 'N'],
        ['M', 'C', 'D'],
        ['P']]
    new_stack.load_stack(test_stack)
    it "will load a nested array like #{test_stack}" do
      expect(new_stack.stack).to eq(test_stack)
    end
  end



end
