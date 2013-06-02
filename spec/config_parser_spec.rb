require 'spec_helper'

describe ConfigParser do
  describe 'parse sizes' do
    it 'should parse sizes from the configuration file' do
      config = ConfigParser.parse 'spec/conf/valid.yml'
      config.sizes.length.should == 3
    end
    
    it 'should parse the sizes into meaningful objects' do
      config = ConfigParser.parse 'spec/conf/valid.yml'
      config.sizes.include?(Size.new 300, 250).should == true
    end
  end
  
  describe 'parse slides' do
    it 'should parse slides from the configuration file' do
      config = ConfigParser.parse 'spec/conf/valid.yml'
      config.slides.length.should == 3
    end
    
    it 'should parse the slides into meaningful objects' do
      config = ConfigParser.parse 'spec/conf/valid.yml'
      slide = config.slides.first
      slide.title.should == 'foo'
      slide.url.should == '/foo/bar'
      slide.ttl.should == 30
    end
  end
end