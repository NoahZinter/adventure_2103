class Trail
  attr_reader :name, :level

  def initialize(details)
    @name = details[:name]
    @length = details[:length]
    @level = details[:level]
  end

  def length
    length_array = @length.split(' ')
    length_array.first.to_f
  end
end