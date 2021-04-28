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

      expected_2 = {
     :moderate => ["Queen's/Navajo Loop", "Tower Bridge"],
     :easy => ["Rim Trail"]
      }
      expect(park2.trails_by_level).to eq expected_2
    end
  end

  # describe '#visitors_log' do
  #   it 'populates a nested hash with a year holding a date/hiker kv pair with possible trails' do
  #     trail1 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
  #     trail2 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
  #     trail3 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
  #     trail4 = Trail.new({name: 'Peekaboo Loop', length: '5.5 miles', level: :strenuous})
  #     park = Park.new('Bryce Canyon')
  #     park.add_trail(trail1)
  #     park.add_trail(trail2)
  #     park.add_trail(trail3)
  #     park.add_trail(trail4)
  #     hiker1 = Hiker.new('Dora', :moderate)
  #     hiker2 = Hiker.new('Frank', :easy)
  #     hiker3 = Hiker.new('Jack', :strenuous)
  #     hiker4 = Hiker.new('Sally', :strenuous)

  #     hiker1.visit(park, Date.new(1980, 6, 23))
  #     hiker2.visit(park, Date.new(1980, 6, 24))
  #     hiker3.visit(park, Date.new(1980, 6, 24))
  #     hiker4.visit(park, Date.new(1980, 6, 25))
  #     hiker1.visit(park, Date.new(2020, 6, 23))
  #     hiker2.visit(park, Date.new(2020, 6, 24))
  #     hiker3.visit(park, Date.new(2020, 6, 24))
  #     hiker4.visit(park, Date.new(2020, 6, 25))

  #     expected = {
  #       1980 => {
  #         "06/23" => {
  #           hiker1 => [trail2, trail3]
  #         },
  #         "06/24" => {
  #           hiker2 => [trail1]
  #           hiker3 => [trail]
  #         },
  #         "06/25" => {
  #           <Hiker:0x00007f8f02326390...> => [#<Trail:0x00007f8f022e5160...>]
  #         }
  #       },
  #       2020 => {
  #         "06/23" => {
  #           #<Hiker:0x00007f8f02184208...> => [#<Trail:0x00007f8f040e25c8...>, #<Trail:0x00007f8f03191ee8...>]
  #         },
  #         "06/24" => {
  #           #<Hiker:0x00007f8f029afb30...> => [#<Trail:0x00007f8f022c6878...>],
  #           #<Hiker:0x00007f8f04045e30...> => [#<Trail:0x00007f8f022e5160...>]
  #         },
  #         "06/25" => {
  #           #<Hiker:0x00007f8f02326390...> => [#<Trail:0x00007f8f022e5160...>]
  #         }
  #     }
  #   end
  # end
end
