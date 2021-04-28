class Hiker
  attr_reader :name, :experience_level, :snacks, :parks_visited

  def initialize(name, experience_level)
    @name = name
    @experience_level = experience_level
    @snacks = Hash.new
    @parks_visited = []
  end

  def pack(snack, quantity)
    if !@snacks.has_key?(snack)
      @snacks[snack] = quantity
    else
      @snacks[snack] = @snacks[snack] + quantity
    end
  end

  def visit(park)
    if !@parks_visited.include?(park)
      @parks_visited << park
    end
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

  def favorite_snack
    favorite = @snacks.max_by do |snack, quantity|
                 quantity
               end
    favorite.first
  end
end
