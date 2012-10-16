class Capture
  def initialize template, size
    @template = template
    @size = size
  end

  def perform
    `phantomjs capture.js #{size_s} #{@template.url} #{filename}`
  end

  private

  def size_s
    "#{@size.width} #{@size.height}"
  end
  
  def filename
    "images/#{@template.name}-#{@size.width}.png"
  end
end