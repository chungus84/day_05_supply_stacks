class Dataloader
  attr_reader :data
  def initialize(file)
    @data = []
    self.load_data(file)
  end

  def load_data(file)
    file_data = File.open(file)
    data_file = file_data.readlines.map(&:chomp)
    data_file.each do |row|
      @data << [row[5, 2].strip.to_i, row[12, 2].strip.to_i, row[17, 2].strip.to_i]
      # puts "#{row[5, 2].strip} and #{row[12, 2].strip} and #{row[17, 2].strip}"

    end
  end
end

# new_d_loader = Dataloader.new('data/data.txt')
