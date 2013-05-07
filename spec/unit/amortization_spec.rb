require File.dirname(__FILE__) + '/../spec_helper'

describe Stater::Amortization do
  before do
    principal     = 250000.00
    periodic_rate = 0.08 / 12
    periods       = 15 * 12

    @amortization = Stater::Amortization.new(principal, periodic_rate, periods)
  end

  it 'should correctly calculate the payment' do
    expect(@amortization.calculate_payment).to eq 2389.13
  end

  it 'should return the calculated payment as a BigDecimal' do
    expect(@amortization.calculate_payment).to be_kind_of(BigDecimal)
  end

  it 'should convert principal to BigDecimal' do
    expect(@amortization.principal).to be_kind_of(BigDecimal)
  end

  it 'should convert periodic_rate to BigDecimal' do
    expect(@amortization.periodic_rate).to be_kind_of(BigDecimal)
  end

  describe 'when initialized with default parameters' do
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

  describe 'schedule' do
    it 'should exactly match the TValue control schedule' do
      @tvalue_schedule = tvalue_schedule('FEC_example_3_3_1.xml')
      # @amortization.schedule.size.should == @tvalue_schedule.size
      @amortization.schedule[0].should == @tvalue_schedule[0]
      @amortization.schedule[1].should == @tvalue_schedule[1]
      @amortization.schedule[25].should == @tvalue_schedule[25]
      @amortization.schedule[70].should == @tvalue_schedule[70]
      @amortization.schedule[150].should == @tvalue_schedule[150]
      @amortization.schedule[179].should == @tvalue_schedule[179]
      # @amortization.schedule[180].should == @tvalue_schedule[180]
    end
  end

end
