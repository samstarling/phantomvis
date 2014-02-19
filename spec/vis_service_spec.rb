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
    
    it 'generates every size of every slide' do
      @persistence.should_receive(:save).exactly(9).times
      @vis.generate_all
    end
    
    it 'sets the last generated time for slides' do
      @time_now = Time.parse('Jan 01 2014 00:00')
      DateTime.stub!(:now).and_return(@time_now)
      @vis.generate_all
      slide = @vis.slides.first
      slide.last_generated.should == @time_now
    end
  end
  
  describe 'generate_expired' do
    before :each do
      @persistence = double('persistence', save: nil)
      config = ConfigParser.parse 'spec/conf/varying_ttls.json'
      @vis = VisService.new config, @persistence
    end
    
    it 'generates all slides the first time it is called' do
      @time_now = Time.parse('Jan 01 2014 00:00')
      DateTime.stub!(:now).and_return(@time_now)
      @persistence.should_receive(:save).exactly(3).times
      @vis.generate_expired
    end
    
    it 'generates only the expired slides when called again' do
      stub_time 'Jan 01 2014 00:00'
      @vis.generate_expired
      stub_time 'Jan 01 2014 00:01'
      @persistence.should_receive(:save).exactly(1).times
      @vis.generate_expired
    end
  end
end