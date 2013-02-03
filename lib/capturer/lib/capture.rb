class Capture
  def initialize template, sizes
    @template = template
    @sizes = sizes
    @last_generated = nil
  end

  def perform
    @last_generated = Time.now
    @sizes.each do |size|
      puts "Capturing #{filename(size)}"
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
    timestamp = @last_generated.to_i
    "images/#{@template.name}-#{size.width}-#{timestamp}.png"
  end
end