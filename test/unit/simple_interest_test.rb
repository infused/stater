require File.dirname(__FILE__) + '/../test_helper'

class Stater::SimpleInterestTest < Test::Unit::TestCase
  
  def test_future_value
    assert_equal '7680.0', Stater::SimpleInterest.future_value(6000.00, 7, 0.04).to_s
  end
  
  def test_present_value
    assert_equal '6000.0', Stater::SimpleInterest.present_value(7680.00, 7, 0.04).to_s
  end
  
  def test_interest
    assert_equal '0.04', Stater::SimpleInterest.interest(6000.00, 7680.00, 7).to_s
  end
  
  def test_years
    assert_equal '7.0', Stater::SimpleInterest.years(6000.00, 7680.00, 0.04).to_s
  end
  
end
