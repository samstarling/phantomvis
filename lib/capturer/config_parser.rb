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
    raise "Size needs two components" if size.split('x').length != 2
    components = size.split('x').map do |num|
      begin
        Integer num.strip
      rescue
        raise "Size needs to be a number"
      end
    end
    Size.new components[0], components[1]
  end
  
  def self.parse_slide slide
    Slide.new slide["title"]
  end
end

class Slide
  attr_accessor :title
  
  def initialize title
    @title = title
  end
  
  def == other
    self.title = other.title
  end
end

class Size
  attr_accessor :width, :height
  
  def initialize width, height
    @width = width
    @height = height
  end
  
  def to_s
    "#{width} x #{height}"
  end
  
  def == other
    self.width = other.width
    self.height = other.height
  end
end

class VisService
  attr_accessor :sizes, :slides
  
  def initialize sizes, slides
    @sizes = sizes
    @slides = slides
  end
end