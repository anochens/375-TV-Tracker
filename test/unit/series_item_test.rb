require 'test_helper'

class SeriesItemTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert SeriesItem.new.valid?
  end
end
