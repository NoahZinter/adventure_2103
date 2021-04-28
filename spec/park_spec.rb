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
end
