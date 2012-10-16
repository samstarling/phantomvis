require_relative 'capture'
require_relative 'size'
require_relative 'template'

class SlideGenerator
  def initialize config
    @config = config
    @base_url = "#{@config['settings']['server_url']}"
    @sizes = Array.new
    @templates = Array.new
    @captures = Array.new
    load_templates
    load_sizes
    load_captures
  end

  def run
    @captures.each do |capture|
      if capture.needs_capturing?
        capture.perform
      end
    end
  end

  def tidy
    `rm images/*.png`
  end

  private

  def load_templates
    @config['templates'].each do |t|
      template = Template.new t, @base_url
      @templates << template
    end
  end

  def load_sizes
    @config['sizes'].each do |s|
      size = Size.new s['width'], s['height']
      @sizes << size
    end
  end
  
  def load_captures
    @templates.each do |template|
      capture = Capture.new template, @sizes
      @captures << capture
    end
  end
end