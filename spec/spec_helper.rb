require 'simplecov'

require_relative '../lib/capturer/config_parser'
require_relative '../lib/capturer/persistence'
require_relative '../lib/capturer/size'
require_relative '../lib/capturer/slide'
require_relative '../lib/capturer/vis_service'

SimpleCov.start

def stub_time str
  datetime = datetime_from_string(str)
  DateTime.stub!(:now).and_return(datetime)
end

def datetime_from_string str
  DateTime.parse(str)
end