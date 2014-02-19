require 'spec_helper'

describe VisService do
  before :each do
    Renderer.stub!(:render).and_return('foo')
  end
  
  describe 'generate_all' do
    before :each do
      @persistence = double('persistence', save: nil)
      config = ConfigParser.parse 'spec/conf/valid.json'
      @vis = VisService.new config, @persistence
    end
    
    it 'saves every size of every slide' do
      @persistence.should_receive(:save).exactly(9).times
      @vis.generate_all
    end
    
    it 'sets the last generated time for slides' do
      @time_now = Time.parse('Jan 01 2014')
      DateTime.stub!(:now).and_return(@time_now)
      @vis.generate_all
      slide = @vis.slides.first
      slide.last_generated.should == @time_now
    end
  end
end