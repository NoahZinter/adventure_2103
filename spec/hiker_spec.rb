require './lib/hiker'

describe Hiker do
  describe '#initialize' do
    it 'exists' do
      hiker = Hiker.new('Dora', :moderate)
      expect(hiker).is_a? Hiker
    end

    it 'has attributes' do
      hiker = Hiker.new('Dora', :moderate)

      expect(hiker.name).to eq 'Dora'
      expect(hiker.experience_level).to eq :moderate
    end

    it 'starts with an empty hash of snacks' do
      hiker = Hiker.new('Dora', :moderate)

      expect(hiker.snacks).to eq ({})
    end

    it 'starts with empty array of parks visited' do
      hiker = Hiker.new('Dora', :moderate)

      expect(hiker.parks_visited).to eq ([])
    end
  end

  describe '#pack' do
    it 'adds snack and quantity to snack hash' do
      hiker = Hiker.new('Dora', :moderate)
      hiker.pack('water', 1)
      hiker.pack('trail mix', 3)
      expected = {
        'water' => 1,
        'trail mix' => 3
      }
      expect(hiker.snacks).to eq expected
    end

    xit 'will update quantity of snack already exists' do
      hiker = Hiker.new('Dora', :moderate)
      hiker.pack('water', 1)
      hiker.pack('trail mix', 3)
      hiker.pack('water', 1)
      expected = {
        'water' => 2,
        'trail mix' => 3
      }
      expect(hiker.snacks).to eq expected
    end
  end
end
