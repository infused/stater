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
    let(:amortization) { Stater::Amortization.new }

    it 'is an empty array' do
      expect(amortization.schedule).to eq []
    end

    specify 'principal is nil' do
      expect(amortization.principal).to be_nil
    end

    specify 'periodic_rate is nil' do
      expect(amortization.periodic_rate).to be_nil
    end

    specify 'periods is nil' do
      expect(amortization.periods).to be_nil
    end
  end

  describe 'schedule' do
    let(:tvalue_schedule) { load_tvalue_schedule('FEC_example_3_3_1.xml') }

    it 'should exactly match the TValue control schedule' do
      # @amortization.schedule.size.should eq @tvalue_schedule.size
      expect(@amortization.schedule[0]).to eq tvalue_schedule[0]
      expect(@amortization.schedule[1]).to eq tvalue_schedule[1]
      expect(@amortization.schedule[25]).to eq tvalue_schedule[25]
      expect(@amortization.schedule[70]).to eq tvalue_schedule[70]
      expect(@amortization.schedule[150]).to eq tvalue_schedule[150]
      expect(@amortization.schedule[179]).to eq tvalue_schedule[179]
      # @amortization.schedule[180].should eq @tvalue_schedule[180]
    end
  end

end
