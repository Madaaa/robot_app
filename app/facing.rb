class Facing
  attr_accessor :direction

  DIRECTIONS = {
    0 => :north,
    1 => :east,
    2 => :south,
    3 => :west
  }

  CODIFICATIONS = {
    north: 'ʌ',
    east: '>',
    south: 'v',
    west: '<'
  }

  def initialize direction
    @direction = direction.to_s.downcase.to_sym
  end

  def valid?
    valid_directions.include? direction
  end

  def order
    directions.invert[direction]
  end

  def next
    @direction = directions[order.next.modulo(directions.size)]
  end

  def previous
    @direction = directions[order.pred.modulo(directions.size)]
  end

  def directions
    DIRECTIONS.freeze
  end

  def valid_directions
    DIRECTIONS.values
  end

  def to_s
    direction.to_s
  end

  def to_code
    CODIFICATIONS[direction]
  end

  def == other
    direction == other.direction
  end
end
