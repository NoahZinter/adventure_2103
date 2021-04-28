class Hiker
  attr_reader :name, :experience_level, :snacks, :parks_visited

  def initialize(name, experience_level)
    @name = name
    @experience_level = experience_level
    @snacks = Hash.new
    @parks_visited = []
  end

  def pack(snack, quantity)
    @snacks[snack] = quantity
  end

  def visit(park)
    @parks_visited << park
  end

  def all_trails
    @parks_visited.map do |park|
      park.trails
    end.flatten
  end

  def possible_trails
    all_trails.select do |trail|
      trail.level == @experience_level
    end
  end
end
