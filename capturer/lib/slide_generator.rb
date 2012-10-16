require_relative 'capture'
require_relative 'size'
require_relative 'template'

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

  def tidy
    `rm images/*.png`
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