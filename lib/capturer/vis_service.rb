class VisService
  attr_reader :sizes, :slides
  
  def initialize configuration, save_agent
    @sizes = configuration.sizes
    @slides = configuration.slides
    @save_agent = save_agent
  end
  
  def save_all
    @slides.each do |slide|
      @sizes.each do |size|
        @save_agent.save slide, size
      end
    end
  end
end
