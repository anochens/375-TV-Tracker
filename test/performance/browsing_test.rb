require 'test_helper'
require 'rails/performance_test_help'

# Profiling results for each test method are written to tmp/performance.
class BrowsingTest < ActionDispatch::PerformanceTest
  def setup
#  	login_as(:alan)
  end
  def test_homepage
    get '/'
  end
end
