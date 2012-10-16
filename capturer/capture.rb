require 'yaml'
require_relative 'lib/slide_generator'

config = YAML::load(File.open('conf/config.yaml'))
generator = SlideGenerator.new(config)
generator.tidy

while true
  generator.run
  sleep 1
end