require_relative 'dataloader'

class Rucksack
  attr_reader :compartments


  def initialize
    @compartments = []
    @d_loader = Dataloader.new
    @d_loader.load('data/data.txt')
    @shared_items = []
  end

  def pack_compartments(arr)
      @compartments << [[arr.split("").slice(0,arr.size/2)], [arr.split("").slice(arr.size/2, arr.size)]]
  end

  def load_packs
    @d_loader.contents.each do |arr|
      pack_compartments(arr)
    end
    @compartments
  end

  def compare_compartments
    @compartments.each do |pack|
      temp_arr = []
      pack.first.flatten.each do |letter|
        if pack.last.flatten.include?(letter) & !temp_arr.include?(letter)
          temp_arr << letter
        end
      end
      @shared_items << temp_arr
    end
    @shared_items
  end

  def assign_priority
    lower = ('a'..'z').to_a
    upper = ('A'..'Z').to_a
    priority = []
    @shared_items.flatten.each do |l|
      if lower.include?(l)
        lower.each_with_index {|v, i| priority << i + 1 if v == l}
      elsif upper.include?(l)
        upper.each_with_index {|v, i| priority << i + 27 if v == l}
      end

    end
    priority.sum
  end

end

new_rucksack = Rucksack.new
# # new_rucksack.pack_compartments('vJrwpWtwJgWrhcsFMMfFFhFp')
new_rucksack.load_packs
new_rucksack.compare_compartments
p new_rucksack.assign_priority
# an_array = [["zBBtHnnHtwwH".split("")], ["plmlRlzPLCpp".split("")]]

# an_array.first.each do |arr|
#   arr.each do |letter|
#     if an_array.last.flatten.any?(letter)
#       puts letter
#     end
#   end
  # puts an_array.last.flatten.any?(letter)
  #   puts letter
  # end
  # pack.to_s.each_char do |char|
  #   if an_array.last.include?(char)
  #     puts char
  #   end
  # end

# end
# p an_array.last.flatten
# puts an_array.last.flatten.any?("z")
