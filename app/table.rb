class Table
  def initialize position, facing, size = Application::TABLE
    @position = position
    @facing = facing
    @size = size
    @table = size.height.times.map { Array.new(size.width, '-') }
  end

  def report
    @table[x_axis][y_axis] = @facing.to_code
    @table.inject('') { |acc, row| acc << "|#{row.join('')}|\n" }
  end

  def x_axis
    @size.height - @position.y - 1
  end

  def y_axis
    @position.x
  end

  def to_s
    report
  end
end
