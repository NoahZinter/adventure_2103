require './lib/hiker'
require './lib/trail'
require './lib/park'
require 'date'

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

    it 'will update quantity of snack already exists' do
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

  describe '#visit' do
    it 'adds park to parks_visited array' do
      hiker = Hiker.new('Dora', :moderate)
      park1 = Park.new('Capitol Reef')
      park2 = Park.new('Bryce Canyon')

      hiker.visit(park1)
      hiker.visit(park2)

      expect(hiker.parks_visited).to eq ([park1, park2])
    end

    it 'will not add parks already visited' do
      hiker = Hiker.new('Dora', :moderate)
      park1 = Park.new('Capitol Reef')
      park2 = Park.new('Bryce Canyon')

      hiker.visit(park1)
      hiker.visit(park2)
      hiker.visit(park1)

      expect(hiker.parks_visited).to eq ([park1, park2])
    end
  end

  describe '#all_trails' do
    it 'returns array of all trails from visited parks' do
      trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
      trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
      trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
      trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
      trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
      park1 = Park.new('Capitol Reef')
      park2 = Park.new('Bryce Canyon')
      park1.add_trail(trail1)
      park1.add_trail(trail2)
      park1.add_trail(trail3)
      park2.add_trail(trail4)
      park2.add_trail(trail5)
      park2.add_trail(trail6)
      hiker = Hiker.new('Dora', :moderate)
      hiker.visit(park1)
      hiker.visit(park2)

      expected = ([trail1, trail2, trail3, trail4, trail5, trail6])
      expect(hiker.all_trails).to eq expected
    end
  end

  describe '#possible_trails' do
    it 'returns array of trails which match experience_level from visited parks' do
      trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
      trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
      trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
      trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
      trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
      park1 = Park.new('Capitol Reef')
      park2 = Park.new('Bryce Canyon')
      park1.add_trail(trail1)
      park1.add_trail(trail2)
      park1.add_trail(trail3)
      park2.add_trail(trail4)
      park2.add_trail(trail5)
      park2.add_trail(trail6)
      hiker = Hiker.new('Dora', :moderate)
      hiker.visit(park1)
      hiker.visit(park2)

      expected = ([trail2, trail4, trail6])
      expect(hiker.possible_trails).to eq expected
    end
  end

  describe '#favorite_snack' do
    it 'returns the name of the item packed with highest quantity' do
      hiker = Hiker.new('Dora', :moderate)
      hiker.pack('water', 2)
      hiker.pack('apple', 4)
      hiker.pack('trail mix', 1)
      hiker.pack('carrot', 3)

      expect(hiker.favorite_snack).to eq 'apple'
    end
  end
end
