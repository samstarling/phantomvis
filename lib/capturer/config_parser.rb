class ConfigParser
  def self.parse file
    config = YAML::load(File.open("conf/#{file}"))
    sizes = config["sizes"].map do |size|
      parsed_size = size.split('x').map { |s| s.strip.to_i }
      Size.new parsed_size[0], parsed_size[1]
    end
    VisService.new sizes
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
  attr_accessor :sizes
  
  def initialize sizes
    @sizes = sizes
  end
end