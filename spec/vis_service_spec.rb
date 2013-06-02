require 'spec_helper'

describe VisService do
  
  describe 'save all' do
    it 'saves every size of every slide' do
      saver = double('save_agent')
      config = ConfigParser.parse 'spec/conf/valid.yml'
      vis = VisService.new config, saver      
      saver.should_receive(:save).with(kind_of(Slide), kind_of(Size)).exactly(9).times

      vis.save_all
    end
  end
end