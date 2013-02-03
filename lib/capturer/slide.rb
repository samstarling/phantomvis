class Slide
  attr_accessor :title
  
  def initialize title
    @title = title
  end
  
  def == other
    self.title = other.title
  end
end