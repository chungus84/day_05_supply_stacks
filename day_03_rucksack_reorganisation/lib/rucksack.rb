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

  def pack_compartments_part2(arr)
    arr.each do |ele|
      @compartments << [ele.first.split(""), ele[1].split(""), ele.last.split("")]
    end
  end

  def load_packs
    @d_loader.contents.each do |arr|
      pack_compartments(arr)
    end
    @compartments
  end

  def load_packs_part2
    arr = @d_loader.contents.each_slice(3)
    pack_compartments_part2(arr)
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

  def compare_compartments_part2
    @compartments.each do |pack|
      temp_arr = []
      pack.first.each do |le|
        if pack[1].include?(le) & pack.last.include?(le) & !temp_arr.include?(le)
          temp_arr << le
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
