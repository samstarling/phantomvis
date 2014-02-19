require_relative 'size'
require_relative 'slide'

require 'json'

class Configuration
  attr_accessor :sizes, :slides
  
  def initialize sizes, slides
    @sizes = sizes
    @slides = slides
  end
end


class ConfigParser
  def self.parse file
    config = JSON.load(File.open(file))
    
    raise "No sizes are defined" unless config["sizes"]
    raise "No slides are defined" unless config["slides"]
    
    sizes = config["sizes"].map { |size| parse_size size }
    slides = config["slides"].map { |slide| parse_slide slide }
    
    Configuration.new sizes, slides
  end
  
  private
  
  def self.parse_size size
    raise "Size needs two components" if size.length != 2
    Size.new size[0], size[1]
  end
  
  def self.parse_slide slide
    Slide.new slide["title"], slide["url"], slide["ttl"]
  end
end
