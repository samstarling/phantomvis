class ConfigParser
  def self.parse file
    config = YAML::load(File.open("conf/#{file}"))
    sizes = config["sizes"].map do |size|
      parse_size size
    end
    VisService.new sizes
  end
  
  private
  
  def self.parse_size size
    components = size.split('x').map { |num| num.strip.to_i }
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