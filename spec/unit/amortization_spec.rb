require File.dirname(__FILE__) + '/../spec_helper'

describe Stater::Amortization, 'when initialized' do
  
  before do 
    @amortization = Stater::Amortization.new
  end
  
  specify 'schedule should be an empty array' do
    @amortization.schedule.should == []
  end
  
  specify 'principal should be nil' do
    @amortization.principal.should be_nil
  end
  
  specify 'periodic_rate should be nil' do
    @amortization.periodic_rate.should be_nil
  end
  
  specify 'periods should be nil' do
    @amortization.periods.should be_nil
  end
  
end

describe Stater::Amortization do
  before do
    principal     = 250000.00
    periodic_rate = 0.08 / 12
    periods       = 15 * 12
    
    @amortization = Stater::Amortization.new(principal, periodic_rate, periods)
  end
  
  it 'should correctly calculate a payment when given the principal, periodic_rate, and periods' do
    @amortization.calculate_payment.should == 2389.13
  end
  
  it 'should return the calculated payment as a BigDecimal' do
    @amortization.calculate_payment.should be_kind_of(BigDecimal)
  end
  
  it 'should convert principal to BigDecimal' do
    @amortization.principal.should be_kind_of(BigDecimal)
  end
  
  it 'should convert periodic_rate to BigDecimal' do
    @amortization.periodic_rate.should be_kind_of(BigDecimal)
  end
end

describe Stater::Amortization, 'schedule' do
  before do
    principal     = 250000.00
    periodic_rate = 0.08 / 12
    periods       = 15 * 12
    
    @amortization = Stater::Amortization.new(principal, periodic_rate, periods)
  end
  
  it 'should exactly match the TValue control schedule'
  # it 'should exactly match the TValue control schedule' do
  #   @amortization.schedule.size.should == tvalue_schedule('FEC_example_3_3_1.xml').size
  # end
end