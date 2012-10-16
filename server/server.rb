require 'sinatra'
require 'haml'
require 'sass'
require 'compass'

require_relative 'lib/now_playing'

get '/' do
  @now = NowPlaying.new
  haml :index
end

get '/style.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :style
end