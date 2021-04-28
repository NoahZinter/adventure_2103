require './lib/trail'
require './lib/park'

describe Park do
  describe '#initialize' do
    it 'exists' do
      park1 = Park.new('Capitol Reef')

      expect(park1).is_a? Park
    end

    it 'has a name' do
      park1 = Park.new('Capitol Reef')

      expect(park1.name).to eq 'Capitol Reef'
    end

    it 'starts with empty array of trails' do
      park1 = Park.new('Capitol Reef')

      expect(park1.trails).to eq ([])
    end
  end

  describe '#add_trail' do
    it 'adds trails to @trails' do
      park1 = Park.new('Capitol Reef')
      trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
      park1.add_trail(trail1)
      park1.add_trail(trail2)

      expected = [trail1, trail2]
      expect(park1.trails).to eq expected
    end
  end

  describe '#trails_shorter_than' do
    it 'returns an array of trails shorter than argument' do
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

      expect(park1.trails_shorter_than(2.5)).to eq ([trail1, trail2])
      expect(park2.trails_shorter_than(2.5)).to eq ([])
    end
  end

  describe '#hikeable_miles' do
    it 'returns the total hikeable miles per park' do
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

      expect(park1.hikeable_miles).to eq 7.5
      expect(park2.hikeable_miles).to eq 16.9
    end
  end

  describe '#trails_by_level' do
    it 'returns a hash with trail level as key and trails as values' do
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

      expected_1 = {
        :easy => ["Grand Wash"],
        :moderate => ["Cohab Canyon"],
        :strenuous => ["Chimney Rock Loop"]
      }
      expect(park1.trails_by_level).to eq expected_1
    end
  end
end
