require 'yaml'

class SlideGenerator
  def initialize config
    @config = config
    @base_url = "#{@config['settings']['server_url']}"
    @sizes = Array.new
    @templates = Array.new
    load_templates
    load_sizes
  end
  
  def run
    @templates.each do |template|
      @sizes.each do |size|
        capture = Capture.new template, size
        capture.perform
      end
    end
  end

  private

  def load_templates
    @config['templates'].each do |t|
      template = Template.new t['name'], "#{@base_url}#{t['url']}"
      @templates << template
    end
  end

  def load_sizes
    @config['sizes'].each do |s|
      size = Size.new s['width'], s['height']
      @sizes << size
    end
  end
end

class Template
  attr_reader :name, :url

  def initialize name, url
    @name = name
    @url = url
  end
end

class Size
  attr_reader :width, :height

  def initialize width, height
    @width = width
    @height = height
  end
end

class Capture
  def initialize template, size
    @template = template
    @size = size
  end

  def perform
    `phantomjs capture.js #{size_s} #{@template.url} #{filename}`
  end
  
  def size_s
    "#{@size.width} #{@size.height}"
  end
  
  def filename
    "images/#{@template.name}-#{@size.width}.png"
  end
end

config = YAML::load(File.open('config.yaml'))
generator = SlideGenerator.new(config)
`rm *.png`
generator.run
`open *.png`
