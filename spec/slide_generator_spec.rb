require 'spec_helper'

describe ConfigParser do
  describe "parse" do
    before(:each) do
      @vis = ConfigParser.parse "test.yml"
    end
    
    it "should parse sizes from the configuration file" do
      @vis.sizes.length.should == 3
    end
    
    it "should parse the sizes into meaningful objects" do
      @vis.sizes.include?(Size.new 300, 250).should == true
    end
  end
end