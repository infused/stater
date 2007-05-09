require File.dirname(__FILE__) + '/../test_helper'

class Stater::TVMTest < Test::Unit::TestCase
  
  def test_future_value
    assert_equal '7935.08318331367', Stater::TVM.fv(6000.00, 0.04, 7, 12).to_s
  end
  
  def test_present_value
    assert_equal '5999.99759298276', Stater::TVM.pv(7935.08, 0.04, 7, 12).to_s
  end
  
  def test_interest
    assert_equal '0.039999942499020946229393302929', sprintf('%3.30f', Stater::TVM.interest(6000.0, 7935.08, 7, 12))
  end
  
  def test_years
    assert_equal '6.99998995405338', Stater::TVM.years(6000.0, 7935.08, 0.04, 12).to_s
  end
  
  def test_interest_to_apr
    assert_equal '0.195618171461533', Stater::TVM.i_to_apr(0.18, 12).to_s
  end
  
  def test_apr_to_interest
    assert_equal '0.179999854440594', Stater::TVM.apr_to_i(0.195618, 12).to_s
  end
  
  def test_apr_to_ear
    assert_equal '0.137919903125943', Stater::TVM.apr_to_ear(0.1299, 12).to_s
  end
  
  def test_ear_to_apr
    assert_equal '0.129900000000001', Stater::TVM.ear_to_apr(0.137919903125943, 12).to_s
  end
  
end