class Capture
  def initialize template, sizes
    @template = template
    @sizes = sizes
  end

  def perform
    @sizes.each do |size|
      `phantomjs capture.js #{size_s(size)} #{@template.url} #{filename(size)}`
    end
  end

  private

  def size_s size
    "#{size.width} #{size.height}"
  end

  def filename size
    "images/#{@template.name}-#{size.width}.png"
  end

  def needs_recapturing?
    
  end
end