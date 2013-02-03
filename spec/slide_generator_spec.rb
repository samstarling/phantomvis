require 'spec_helper'

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
    
    it 'should throw an exception for any invalid sizes' do
      file = 'spec/conf/invalid_size.yml'
      error = 'Size needs two components'
      expect { ConfigParser.parse file }.to raise_error(Exception, error)
    end
    
    it 'should throw an exception for any non-numeric sizes' do
      file = 'spec/conf/invalid_size_non_numeric.yml'
      error = 'Size needs to be a number'
      expect { ConfigParser.parse file }.to raise_error(Exception, error)
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