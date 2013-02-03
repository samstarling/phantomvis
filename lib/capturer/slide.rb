class Slide
  attr_accessor :title, :url, :ttl
  
  def initialize title, url, ttl
    @title = title
    @url = url
    @ttl = ttl
  end
  
  def == other
    self.title = other.title
  end
end