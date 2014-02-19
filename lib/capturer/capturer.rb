require_relative 'vis_service'
require_relative 'config_parser'

class DefaultPersistence
  def save file
    puts "Opening #{file}"
    `open #{file}`
  end
end

