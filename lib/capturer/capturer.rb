require_relative 'vis_service'
require_relative 'config_parser'

class DefaultPersistence
  def save file
    puts "Opening #{file}"
    `open #{file}`
  end
end

file = "#{File.dirname(__FILE__)}/../../conf/config.yaml"
config = ConfigParser.parse file
persistence = DefaultPersistence.new
service = VisService.new config, persistence
service.save_all