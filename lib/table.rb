class Table
  def initialize(width, length)
    @width = width
    @length = length
  end

  def inside?(x,y)
    (0..@width).include?(x) && (0..@length).include?(y)
  end
end