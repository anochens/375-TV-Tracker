require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
  def test_series_add
     c = Factory :channel
     c.series_items = []
     c.series_items << Factory(:series_item)     

     assert c.name
     assert_equal 1, c.series_items.size
     assert_equal 1, SeriesItem.all.size
  end

  def test_dep_delete
     c = Factory :channel
     c.series_items = []
     c.series_items << Factory(:series_item)     
     assert_equal 1, SeriesItem.all.size    
     c.destroy

     assert_equal 0, SeriesItem.all.size    
     assert_equal 0, Channel.all.size    
  end                             
end
