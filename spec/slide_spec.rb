describe Slide do
  describe 'expired?' do
    before :each do
      @slide = Slide.new 'Title', 'URL', 600
      @slide.last_generated = datetime_from_string '2014-01-01 09:00'
    end
    
    it 'is false if the time since last generated is below the TTL' do
      stub_time '2014-01-01 09:01'
      @slide.expired?.should == false
    end
    
    it 'is true if the time since last generated is above the TTL' do
      stub_time '2014-01-01 09:11'
      @slide.expired?.should == true
    end
    
    it 'is true if there is no last generated time' do
      @slide.last_generated = nil
      stub_time '2014-01-01 09:01'
      @slide.expired?.should == true
    end
  end
end