class Position
  attr_accessor :x, :y, :validator

  def initialize x, y
    @validator = PositionValidator.new
    @x = x.to_i
    @y = y.to_i
  end

  def valid?
    validator.valid? x, y
  end

  def to_s
    "(x: #{x}, y: #{y})"
  end

  def left
    validator.when_horizontal_valid?(x.pred) do
      @x -= 1
    end
  end

  def right
    validator.when_horizontal_valid?(x.next) do
      @x += 1
    end
  end

  def up
    validator.when_vertical_valid?(y.next) do
      @y += 1
    end
  end

  def down
    validator.when_vertical_valid?(y.pred) do
      @y -= 1
    end
  end

  def == other
    x == other.x && y == other.y
  end
end
