require 'tempfile'

class Renderer
  def render slide, size
    path = "tmp/#{slide.title}-#{size.width}-#{size.height}.png"
    `phantomjs #{File.dirname(__FILE__)}/capture.js #{size.width} #{size.height} #{slide.url} #{path}`
    path
  end
end

class VisService
  attr_reader :sizes, :slides
  
  def initialize configuration, persistence
    @sizes = configuration.sizes
    @slides = configuration.slides
    @persistence = persistence
    @renderer = Renderer.new
  end
  
  def save_all
    @slides.each do |slide|
      @sizes.each do |size|
        file = @renderer.render slide, size
        @persistence.save file
      end
    end
  end
end
