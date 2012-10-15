SLIDES = {
  'home' => 'http://0.0.0.0:9292'
}

SIZES = [
  [300, 250],
  [400, 300],
  [640, 480]
]

SLIDES.each do |name, url|
  SIZES.each do |size|
    puts "#{name}-#{size[0]}.png"
    `phantomjs capture.js #{size[0]} #{size[1]} #{url} #{name}-#{size[0]}.png`
  end
end

