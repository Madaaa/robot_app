Position = Struct.new(:x, :y) do
  def to_s
    "x: #{x}, y: #{y}"
  end
end

Direction = Struct.new(:facing) do
  def order
    directions.invert(facing)
  end

  def next
    directions[order.next.modulo(directions.size)]
  end

  def previous
    directions[order.pred.modulo(directions.size)]
  end

  def directions
    {
      0 => :north,
      1 => :east,
      2 => :south,
      3 => :west
    }.freeze
  end
end

class Robot
  attr_accessor :position, :facing

  def initialize x, y, facing
    @position = Position.new(x, y)
    @facing = facing
  end

  def self.place x, y, facing
    new x, y, facing
  end

  def move
    facings.fetch(facing).call(position)
  end

  def left
    Direction.new(facing).previous
  end

  def right
    Direction.new(facing).next
  end

  def report
    to_s
  end

  def to_s
    "#{position}, facing: #{facing}"
  end

  private
  def facings
    {
      north: ->(position) { position.y += 1 },
      south: ->(position) { position.y -= 1 },
      east: ->(position) { position.x += 1 },
      west: ->(position) { position.x -= 1 }
    }
  end
end
