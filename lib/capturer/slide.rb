class Slide
  attr_accessor :title, :url, :ttl, :last_generated
  
  def initialize title, url, ttl
    @title = title
    @url = url
    @ttl = ttl
    @last_generated = nil
  end
  
  def reset
  end
  
  def == other
    self.title = other.title
  end
end