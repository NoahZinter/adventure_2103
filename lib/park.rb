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

  def trails_by_level
    trail_guide = @trails.reduce({}) do |guide, trail|
      guide.update(trail.level => [])
    end
    trail_guide.map do |level, name|
      @trails.each do |trail|
        if level == trail.level
          name << trail.name
        end
      end
    end
    trail_guide
  end
end
