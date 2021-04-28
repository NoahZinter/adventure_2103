class Park
  attr_reader :name, :trails

  def initialize(name)
    @name = name
    @trails = []
  end

  def add_trail(trail)
    @trails << trail
  end

  def trails_shorter_than(miles)
    @trails.select do |trail|
      trail.length < miles
    end
  end

  def hikeable_miles
    @trails.map do |trail|
      trail.length
    end.sum
  end
end
