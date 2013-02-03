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