class ConfigParser
  def self.parse file
    config = YAML::load(File.open(file))
    sizes = config["sizes"].map do |size|
      parse_size size
    end
    VisService.new sizes
  end
  
  private
  
  def self.parse_size size
    raise "Invalid size" if size.split('x').length != 2
    components = size.split('x').map do |num|
      Integer num.strip
    end
    Size.new components[0], components[1]
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
  
  def ==(other)
    self.width = other.width
    self.height = other.height
  end
end

class VisService
  attr_accessor :sizes
  
  def initialize sizes
    @sizes = sizes
  end
end