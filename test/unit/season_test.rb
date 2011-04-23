require 'test_helper'

class SeasonTest < ActiveSupport::TestCase
   def test_dependent_create
      s = Factory(:season,:series_item_id => Factory(:series_item).id)
      s.save!

      assert_equal 1, Season.all.size
      assert_equal 1, SeriesItem.all.size

      s.destroy
   end 
end
