require 'dataloader'

describe Dataloader do
  describe '.load' do
    context "it loads the all lines from data.txt" do
      it 'rturns and array length of 6' do
        new_dataloader = Dataloader.new
        expect(new_dataloader.load('data/data.txt').length).to eq(300)
      end
    end
  end
end
