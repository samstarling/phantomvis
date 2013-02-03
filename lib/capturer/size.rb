class Size
  attr_accessor :width, :height
  
  def initialize width, height
    @width = Integer(width)
    @height = Integer(height)
  end
  
  def to_s
    "#{width} x #{height}"
  end
  
  def == other
    self.width = other.width
    self.height = other.height
  end
end
