class Facing
  attr_accessor :direction

  DIRECTIONS = {
    0 => :north,
    1 => :east,
    2 => :south,
    3 => :west
  }

  def initialize direction
    direction = direction.to_s.downcase.to_sym
    @direction = if self.class.valid? direction
      direction
    end
  end

  def order
    directions.invert[direction]
  end

  def next
    directions[order.next.modulo(directions.size)]
  end

  def previous
    directions[order.pred.modulo(directions.size)]
  end

  def directions
    DIRECTIONS.freeze
  end

  def to_s
    direction.to_s
  end

  class << self
    def valid? direction
      valid_directions.include? direction
    end

    def valid_directions
      DIRECTIONS.values
    end
  end
end
