class Template
  attr_reader :name, :url, :ttl

  def initialize config, base_url
    @name = config['name']
    @url = "#{base_url}#{config['url']}"
    @ttl = config['ttl']
  end
end