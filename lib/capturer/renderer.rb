class Renderer
  def self.render slide, size
    path = "tmp/#{slide.title}-#{size.width}-#{size.height}.png"
    `phantomjs #{File.dirname(__FILE__)}/capture.js #{size.width} #{size.height} #{slide.url} #{path}`
    path
  end
end