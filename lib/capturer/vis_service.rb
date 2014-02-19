require_relative 'renderer'

require 'date'

class VisService
  attr_reader :sizes, :slides
  
  def initialize configuration, persistence
    @sizes = configuration.sizes
    @slides = configuration.slides
    @persistence = persistence
    @renderer = Renderer
  end
  
  def generate_all
    generate @slides
  end
  
  def generate_expired
    expired = @slides.select { |s| s.expired? }
    generate expired
  end
  
  private
  
  def generate slides
    slides.each do |slide|
      @sizes.each do |size|
        file = @renderer.render slide, size
        @persistence.save file
        slide.last_generated = DateTime.now
      end
    end
  end
end
