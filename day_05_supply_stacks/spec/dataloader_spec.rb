require 'dataloader'

describe Dataloader do
  describe '.load_data' do
    d_loader = Dataloader.new
    d_loader.load_data('data/data_test.txt')
    expected_array = [[1, 2, 1], [3, 1, 3], [2, 2, 1], [1, 1, 2]]
    it "will load data from file data/data_test.txt and will produce an nested array like #{expected_array}" do
      expect(d_loader.data).to eq(expected_array)
    end
  end
end
