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
end
