class Capture
  def initialize template, sizes
    @template = template
    @sizes = sizes
    @last_generated = nil
  end

  def perform
    @last_generated = Time.now
    puts "Capturing #{@template.name}"
    @sizes.each do |size|
      `phantomjs capture.js #{size_s(size)} #{@template.url} #{filename(size)}`
    end
  end
  
  def needs_capturing?
    if @last_generated
      Time.now - @last_generated > @template.ttl
    else
      true
    end
  end

  private

  def size_s size
    "#{size.width} #{size.height}"
  end

  def filename size
    "images/#{@template.name}-#{size.width}.png"
  end
end