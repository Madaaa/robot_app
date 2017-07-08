class Position
  attr_accessor :x, :y, :validator

  def initialize x, y
    x = x.to_i
    y = y.to_i
    @validator = PositionValidator.new

    if validator.valid? x: x, y: y
      @x = x
      @y = y
    end
  end

  def to_s
    "x: #{x}, y: #{y}"
  end

  def left
    validator.when_horizontal_valid?(x) do
      @x -= 1
    end
  end

  def right
    validator.when_horizontal_valid?(x) do
      self.x += 1
    end
  end

  def up
    validator.when_vertical_valid?(y) do
      @y += 1
    end
  end

  def down
    validator.when_vertical_valid?(y) do
      @y -= 1
    end
  end
end
