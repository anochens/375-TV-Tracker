require 'test_helper'

class SeriesItemTest < ActiveSupport::TestCase
   def test_no_del_channel
      s = Factory :series_item
      s.channel = Factory(:channel)
      assert 1, Channel.all.size
      assert 1, SeriesItem.all.size

      s.destroy
      assert 1, Channel.all.size
      assert 0, SeriesItem.all.size
   end
end
