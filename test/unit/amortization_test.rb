require File.dirname(__FILE__) + '/../test_helper'

class Stater::AmortizationTest < Test::Unit::TestCase
  
  def test_payment_amount
    assert_equal '26.38', Stater::Amortization.payment_amount(100.00, 0.10, 5).to_s
  end
  
end