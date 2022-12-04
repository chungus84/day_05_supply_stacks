
class Dataloader
  attr_reader :contents
  def initialize
    @contents = []
  end

  def load(file)
    file_data = File.open(file)
    @contents = file_data.readlines.map(&:chomp)
  end
end

# new_file = 'data/data.txt'

# new_dloader = Dataloader.new

# new_dloader.load(new_file)

# p new_dloader.contents
