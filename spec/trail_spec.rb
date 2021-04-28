require './lib/trail'

describe Trail do
  describe '#initialize' do
    it 'exists' do
      trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})

      expect(trail1).is_a? Trail
    end
  end
end