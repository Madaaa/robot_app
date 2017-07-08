class Robot
  attr_accessor :position, :facing

  def place x, y, facing
    new_position = Position.new(x, y)
    new_facing = Facing.new(facing)

    if new_position.valid? && new_facing.valid?
      @position, @facing = new_position, new_facing
    end

    self
  end

  def placed?
    @position && @facing
  end

  def move
    placed? && moves.fetch(facing.direction).call(position)
    self
  end

  def left
    placed? && facing.previous
    self
  end

  def right
    placed? && facing.next
    self
  end

  def report
    table = 5.times.map { Array.new(5, '-') }
    table[position.x][position.y] = facing.to_code
    table.inject('') { |acc, row| acc << '|' << row.join('') << "|\n" }
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
