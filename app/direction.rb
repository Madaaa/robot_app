Direction = Struct.new(:facing) do
  def order
    directions.invert[facing]
  end

  def next
    directions[order.next.modulo(directions.size)]
  end

  def previous
    directions[order.pred.modulo(directions.size)]
  end

  def directions
    self.class.directions
  end

  def self.directions
    {
      0 => :north,
      1 => :east,
      2 => :south,
      3 => :west
    }.freeze
  end
end
