require File.dirname(__FILE__) + '/../spec_helper'

describe Stater::TVM do
  before do
    @present_value    = 6000.00
    @future_value     = 7935.08
    @interest         = 0.04
    @years            = 7
    @periods_per_year = 12
    @delta            = 0.005
  end

  describe 'future_value' do
    it 'calculates future value' do
      fv = Stater::TVM.fv(@present_value, @interest, @years, @periods_per_year)
      expect(fv).to be_within(@delta).of(@future_value)
    end

    it "defaults to 12 periods per year" do
      fv = Stater::TVM.fv(@present_value, @interest, @years)
      expect(fv).to be_within(@delta).of(@future_value)
    end
  end

  describe 'present_value' do
    let(:pv) { Stater::TVM.pv(@future_value, @interest, @years, @periods_per_year) }

    it 'calculates present value' do
      expect(pv).to be_within(@delta).of(@present_value)
    end
  end

  describe 'interest' do
    let(:interest) { Stater::TVM.interest(@present_value, @future_value, @years, @periods_per_year).to_f }

    it 'calculates interest' do
      expect(interest).to be_within(@delta).of(@interest)
    end
  end

  describe 'years' do
    let(:years) { Stater::TVM.years(@present_value, @future_value, @interest, @periods_per_year) }

    it 'caculates years' do
      expect(years).to be_within(@delta).of(@years)
    end
  end

  describe 'i_to_apr' do
    it 'should convert simple interest to APR' do
      expect(Stater::TVM.i_to_apr(0.18, 12)).to be_within(@delta).of(0.195)
    end
  end

  describe 'apr_to_i' do
    it 'should convert APR to simple interest' do
      expect(Stater::TVM.apr_to_i(0.195, 12)).to be_within(@delta).of(0.179)
    end
  end

  describe 'apr_to_ear' do
    it 'should convert APR to EAR' do
       expect(Stater::TVM.apr_to_ear(0.129, 12)).to be_within(@delta).of(0.137)
    end
  end

  describe 'ear_to_apr' do
    let(:apr) { Stater::TVM.ear_to_apr(0.138, 12) }

    it 'should convert EAR to APR' do
      expect(apr).to be_within(@delta).of(0.129)
    end
  end
end
