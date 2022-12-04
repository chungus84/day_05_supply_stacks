require 'rucksack'

describe Rucksack do
  describe '.pack_compartments' do
    context ' given vJrwpWtwJgWrhcsFMMfFFhFp' do
      it 'return turn arrays of equal length' do
        new_rucksack = Rucksack.new
        new_rucksack.pack_compartments('vJrwpWtwJgWrhcsFMMfFFhFp')
        expect(new_rucksack.compartments.first.size == new_rucksack.compartments.last.size)
      end
    end
  end
  describe '.load_packs' do
    context 'given data from data/data.txt' do
      it 'returns an array of 6 arrays containing 2 arrays in each' do
        new_rucksack = Rucksack.new
        new_rucksack.load_packs
        expect(new_rucksack.compartments.length).to eq(300)
        expect(new_rucksack.compartments.first.size).to eq(2)
      end
    end
  end
end
