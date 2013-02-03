require_relative 'size'
require_relative 'slide'

class ConfigParser
  def self.parse file
    config = YAML::load(File.open(file))
    
    raise "No sizes are defined" unless config["sizes"]
    raise "No slides are defined" unless config["slides"]
    
    sizes = config["sizes"].map { |size| parse_size size }
    slides = config["slides"].map { |slide| parse_slide slide }
    
    VisService.new sizes, slides
  end
  
  private
  
  def self.parse_size size
    components = size.split('x')
    raise "Size needs two components" if components.length != 2
    Size.new components[0], components[1]
  end
  
  def self.parse_slide slide
    Slide.new slide["title"]
  end
end

class VisService
  attr_accessor :sizes, :slides
  
  def initialize sizes, slides
    @sizes = sizes
    @slides = slides
  end
end