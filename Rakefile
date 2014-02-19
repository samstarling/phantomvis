require_relative 'lib/capturer/capturer'

task :generate_all do |t|
  file = "#{File.dirname(__FILE__)}/conf/config.json"
  config = ConfigParser.parse file
  persistence = DefaultPersistence.new
  service = VisService.new config, persistence
  service.generate_all
end