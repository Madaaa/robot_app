class Robot
  attr_accessor :position, :facing

  def place x, y, facing
    @position = Position.new(x, y)
    @facing = facing
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
      north: ->(position) { position.up },
      south: ->(position) { position.down },
      east: ->(position) { position.right },
      west: ->(position) { position.left }
    }
  end
end
