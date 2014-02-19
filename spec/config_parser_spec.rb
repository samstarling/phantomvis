require 'spec_helper'

describe ConfigParser do
  describe 'parse sizes' do
    it 'should parse sizes from the configuration file' do
      config = ConfigParser.parse 'spec/conf/valid.json'
      config.sizes.length.should == 3
    end
    
    it 'should parse the sizes into meaningful objects' do
      config = ConfigParser.parse 'spec/conf/valid.json'
      config.sizes.include?(Size.new 300, 250).should == true
    end
  end
  
  describe 'parse slides' do
    before :each do
      @config = ConfigParser.parse 'spec/conf/valid.json'
      @first_slide = @config.slides.first
    end
    
    it 'should parse slides from the configuration file' do
      @config.slides.length.should == 3
    end
    
    it 'should parse the slide title' do
      @first_slide.title.should == 'foo'
    end
    
    it 'should parse the slide URL' do
      @first_slide.url.should == '/foo/bar'
    end
    
    it 'should parse the slide TTL' do
      @first_slide.ttl.should == 10
    end
  end
end