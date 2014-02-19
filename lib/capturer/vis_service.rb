require_relative 'renderer'

class VisService
  attr_reader :sizes, :slides
  
  def initialize configuration, persistence
    @sizes = configuration.sizes
    @slides = configuration.slides
    @persistence = persistence
    @renderer = Renderer
  end
  
  def generate_all
    @slides.each { |s| s.reset }
    generate_old
  end
  
  def generate_old
    @slides.each do |slide|
      @sizes.each do |size|
        file = @renderer.render slide, size
        @persistence.save file
        slide.last_generated = DateTime.now
      end
    end
  end
end
