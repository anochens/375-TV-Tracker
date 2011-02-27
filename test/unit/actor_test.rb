require 'test_helper'

class ActorTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Actor.new.valid?
  end
end
