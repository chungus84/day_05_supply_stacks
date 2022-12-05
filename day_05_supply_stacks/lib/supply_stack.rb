require_relative 'dataloader'

class SupplyStack
  attr_reader :stack
  def initialize(file)
    @stack = []
    @moves = Dataloader.new(file)
  end

  def load_stack(new_stack)
    new_stack.each do |arr|
      @stack << arr
    end
  end

  def move_stack
    @moves.data.each do |arr|

      popped = @stack[arr[1]-1].pop(arr[0])
      # p popped
      popped.each do |ele|
        @stack[arr[2]-1].append(ele)

      end
      # @stack.each {|arr| p arr.flatten }
    end
    @stack.each {|arr| p arr.flatten }
  end
end


new_stack = SupplyStack.new('data/data.txt')
# test_stack = [['Z'], ['N']],
#         [['M'], ['C'], ['D']],
#         [['P']]

actual_data = [['F'],['H'],['B'],['V'],['R'],['Q'],['D'],['P']],
              [['L'],['D'],['Z'],['Q'],['W'],['V']],
              [['H'],['L'],['Z'],['Q'],['G'],['R'],['P'],['C']],
              [['R'],['D'],['H'],['F'],['J'],['V'],['B']],
              [['Z'],['W'],['L'],['C']],
              [['J'],['R'],['P'],['N'],['T'],['G'],['V'],['M']],
              [['J'],['R'],['L'],['V'],['M'],['B'],['S']],
              [['D'],['P'],['J']],
              [['D'],['C'],['N'],['W'],['V']]


new_stack.load_stack(actual_data)

new_stack.move_stack
# p new_stack.stack
# popped = new_stack.stack[1].pop(2)
# new_stack.stack
# popped

# new_stack.stack[0].append(popped)
# new_stack.stack
# new_stack.stack.each {|arr| p arr}

# popped = new_stack.stack[1].pop(2)
# p new_stack.stack

# new_stack.stack[0] << popped

# p new_stack.stack
