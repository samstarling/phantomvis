require 'spec_helper'

describe ConfigParser do
  describe "parse" do
    it "should parse sizes from the configuration file" do
      @vis = ConfigParser.parse 'spec/conf/valid.yml'
      @vis.sizes.length.should == 3
    end
    
    it "should parse the sizes into meaningful objects" do
      @vis = ConfigParser.parse 'spec/conf/valid.yml'
      @vis.sizes.include?(Size.new 300, 250).should == true
    end
    
    it "should throw an exception for any invalid sizes" do
      file = 'spec/conf/invalid_size.yml'
      expect { ConfigParser.parse file }.to raise_error
    end
    
    it "should throw an exception for any non-numeric sizes" do
      file = 'spec/conf/invalid_size_non_numeric.yml'
      expect { ConfigParser.parse file }.to raise_error
    end
  end
end