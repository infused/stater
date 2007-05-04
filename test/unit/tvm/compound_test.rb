require File.dirname(__FILE__) + '/../../test_helper'

class Stater::TVM::CompoundTest < Test::Unit::TestCase
  
  def test_future_value
    assert_equal '7935.08318331367', Stater::TVM::Compound.fv(6000.00, 0.04, 7, 12).to_s
  end
  
  def test_present_value
    assert_equal '5999.99759298276', Stater::TVM::Compound.pv(7935.08, 0.04, 7, 12).to_s
  end
  
  def test_interest
    assert_equal '0.039999942499020946229393302929', sprintf('%3.30f', Stater::TVM::Compound.interest(6000.0, 7935.08, 7, 12))
  end
  
  def test_years
    assert_equal '6.99998995405338', Stater::TVM::Compound.years(6000.0, 7935.08, 0.04, 12).to_s
  end
  
  def test_interest_to_apr
    assert_equal '0.195618171461533', Stater::TVM::Compound.i_to_apr(0.18, 12).to_s
  end
  
  def test_apr_to_interest
    assert_equal '0.179999854440594', Stater::TVM::Compound.apr_to_i(0.195618, 12).to_s
  end
  
end