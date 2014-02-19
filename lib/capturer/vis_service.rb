require_relative 'renderer'

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
