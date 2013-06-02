class Slide
  attr_accessor :title, :url, :ttl
  
  def initialize title, url, ttl
    @title = title
    @url = url
    @ttl = ttl
  end
  
  def == other
    # TODO What does this do?
    self.title = other.title
  end
end