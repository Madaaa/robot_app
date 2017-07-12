class Robot
  attr_accessor :position, :facing

  def place x, y, facing
    new_position = Position.new(x, y)
    new_facing = Facing.new(facing)

    if new_position.valid? && new_facing.valid?
      @position, @facing = new_position, new_facing
    end

    nil
  end

  def placed?
    @position && @facing
  end

  def move
    placed? && moves.fetch(facing.direction).call(position)
    nil
  end

  def left
    placed? && facing.previous
    nil
  end

  def right
    placed? && facing.next
    nil
  end

  def report
    to_s
  end

  def to_s
    "position: #{position}, facing: #{facing}"
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
