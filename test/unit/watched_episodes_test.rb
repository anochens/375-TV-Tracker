require 'test_helper'

class WatchedEpisodesTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert WatchedEpisodes.new.valid?
  end
end
