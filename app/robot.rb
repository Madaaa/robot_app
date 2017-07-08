class Robot
  attr_accessor :position, :facing

  def place x, y, facing
    @position = Position.new(x, y)
    @facing = Facing.new(facing)
  end

  def placed?
    @position && @facing
  end

  def move
    moves.fetch(facing.direction).call(position)
  end

  def left
    facing.previous
  end

  def right
    facing.next
  end

  def report
    to_s
  end

  def to_s
    "#{position}, facing: #{facing}"
  end

  def inspect
    "<Robot##{object_id},#{self}> "
  end

  private
  def moves
    {
      north: ->(position) { position.up },
      south: ->(position) { position.down },
      east: ->(position) { position.right },
      west: ->(position) { position.left }
    }
  end
end
