require 'yaml'

class Capturer
  def initialize config
    @config = config
    @sizes = config['sizes']
    @base_url = "#{config['settings']['server_url']}"
    @templates = Array.new
    load_templates
  end
  
  def perform_capture
    @templates.each do |template|
      @sizes.each do |size|
        url = "#{@base_url}#{template.url}"
        `phantomjs capture.js #{size['width']} #{size['height']} #{url} #{template.name}-#{size['width']}.png`
      end
    end
  end

  private

  def load_templates
    @config['templates'].each do |slide|
      add_template Template.new slide['name'], slide['url']
    end
  end

  def add_template template
    @templates << template
  end
end

class Template
  attr_reader :name, :url

  def initialize name, url
    @name = name
    @url = url
  end
end

class Slide
  def initialize
  end
end

config = YAML::load(File.open('config.yaml'))
capturer = Capturer.new(config)
`rm *.png`
capturer.perform_capture
`open *.png`
