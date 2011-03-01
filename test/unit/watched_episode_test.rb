require 'test_helper'

class WatchedEpisodeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert WatchedEpisode.new.valid?
  end
end
