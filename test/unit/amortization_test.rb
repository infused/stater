require File.dirname(__FILE__) + '/../test_helper'

class Stater::AmortizationTest < Test::Unit::TestCase
  
  def test_new_amortization
    amortization = Stater::Amortization.new
    # assert_equal [], amortization.schedule
    assert_nil amortization.principal
    assert_nil amortization.periodic_rate
    assert_nil amortization.periods
  end
  
  def test_payment
    principal = 250000.00
    periodic_rate = 0.08 / 12
    periods = 15 * 12
    
    amortization = Stater::Amortization.new(250000.00, periodic_rate, periods)
    assert_equal '2389.13', amortization.payment.to_s
  end
  
  def test_schedule
    principal = 250000.00
    periodic_rate = 0.08 / 12
    periods = 15 * 12
    
    amortization = Stater::Amortization.new(250000.00, periodic_rate, periods)
    # assert_equal '', amortization.schedule
  end
  
end