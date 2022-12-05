class Dataloader
  attr_reader :data
  def initialize
    @data = []
  end

  def load_data(file)
    file_data = File.open(file)
    data_file = file_data.readlines.map(&:chomp)
    data_file.each do |row|
      @data << [row[5].to_i, row[12].to_i, row[17].to_i]
    end
  end
end
