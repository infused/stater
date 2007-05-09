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
    
    assert_kind_of BigDecimal, amortization.payment
    assert_equal BigDecimal('2389.13'), amortization.payment
  end
  
  def test_schedule
    principal = 250000.00
    periodic_rate = 0.08 / 12
    periods = 15 * 12
    
    amortization = Stater::Amortization.new(principal, periodic_rate, periods)
    
    assert_kind_of BigDecimal, amortization.principal
    assert_equal BigDecimal(principal.to_s), amortization.principal
    
    assert_kind_of BigDecimal, amortization.periodic_rate
    assert_equal BigDecimal(periodic_rate.to_s), amortization.periodic_rate
    
    assert_kind_of Fixnum, amortization.periods
    assert_equal periods, amortization.periods
    
    payment = amortization.schedule.first
    assert_kind_of Fixnum, payment.payment_number
    assert_kind_of BigDecimal, payment.payment
    assert_kind_of BigDecimal, payment.principal
    assert_kind_of BigDecimal, payment.interest
    assert_kind_of BigDecimal, payment.remaining_principal
  end
  
end