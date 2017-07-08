class PositionValidator
  def horizontal
    0..4
  end

  def vertical
    0..4
  end

  def when_vertical_valid? val
    result = vertical.cover? val
    yield if block_given? && result
    result
  end

  def when_horizontal_valid? val
    result = horizontal.cover? val
    yield if block_given? && result
    result
  end

  def valid? x:, y:
    when_horizontal_valid?(x) && when_vertical_valid?(y)
  end
end
