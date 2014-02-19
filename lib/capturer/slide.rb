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
  
  def expired?
    seconds_since_generated >= ttl
  end
  
  def == other
    self.title = other.title
  end
  
  private
  
  def seconds_since_generated
    ((DateTime.now - @last_generated) * 24 * 60 * 60).to_i
  end
end