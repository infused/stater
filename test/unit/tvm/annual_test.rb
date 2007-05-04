require File.dirname(__FILE__) + '/../../test_helper'

class Stater::TVM::AnnualTest < Test::Unit::TestCase
  include Stater::TVM::Annual
  
  def test_fv
    assert_equal '99.9915', fv(95.23, 0.05, 1).to_s
  end
  
  def test_pv
    assert_equal '95.2380952380952', pv(100.00, 0.05, 1).to_s
  end
  
  # def test_interest
  #   assert_equal '0.039999942499020946229393302929', sprintf('%3.30f', Stater::CompoundInterest.interest(6000.0, 7935.08, 7, 12))
  # end
  # 
  # def test_years
  #   assert_equal '6.99998995405338', Stater::CompoundInterest.years(6000.0, 7935.08, 0.04, 12).to_s
  # end
  # 
  # def test_interest_to_apr
  #   assert_equal '0.195618171461533', Stater::CompoundInterest.interest_to_apr(0.18, 12).to_s
  # end
  # 
  # def test_apr_to_interest
  #   assert_equal '0.179999854440594', Stater::CompoundInterest.apr_to_interest(0.195618, 12).to_s
  # end
  
end