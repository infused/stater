require File.dirname(__FILE__) + '/../test_helper'

class Stater::BaseTest < Test::Unit::TestCase
  
  def test_sum_consecutive_integers
    assert_equal 300, Stater::Base.sum_consecutive_integers(24)
  end
  
end