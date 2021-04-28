require './lib/hiker'

describe Hiker do
  describe '#initialize' do
    it 'exists' do
      hiker = Hiker.new('Dora', :moderate)
      expect(hiker).is_a? Hiker
    end
  end
end