require 'yaml'
require_relative 'lib/slide_generator'

config = YAML::load(File.open('config.yaml'))
generator = SlideGenerator.new(config)
generator.tidy
generator.run