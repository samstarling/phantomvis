require 'spec_helper'

describe Size do
  it 'should convert strings to integers' do
    size = Size.new "100", "200"
    size.width.should == 100
    size.height.should == 200
  end
  
  it 'should trim strings' do
    size = Size.new "100 ", "  200"
    size.width.should == 100
    size.height.should == 200
  end
end

describe ConfigParser do
  describe 'parse sizes' do
    it 'should parse sizes from the configuration file' do
      @vis = ConfigParser.parse 'spec/conf/valid.yml'
      @vis.sizes.length.should == 3
    end
    
    it 'should parse the sizes into meaningful objects' do
      @vis = ConfigParser.parse 'spec/conf/valid.yml'
      @vis.sizes.include?(Size.new 300, 250).should == true
    end
  end
  
  describe 'parse slides' do
    it 'should parse slides from the configuration file' do
      @vis = ConfigParser.parse 'spec/conf/valid.yml'
      @vis.slides.length.should == 3
    end
    
    it 'should parse the slides into meaningful objects' do
      @vis = ConfigParser.parse 'spec/conf/valid.yml'
      @vis.slides.include?(Slide.new 'foo').should == true
    end
  end
end