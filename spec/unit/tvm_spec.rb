require File.dirname(__FILE__) + '/../spec_helper'

describe Stater::TVM do
  before(:each) do
    @present_value    = 6000.00
    @future_value     = 7935.08
    @interest         = 0.04
    @years            = 7
    @periods_per_year = 12
    @periodic_rate    = @interest / @periods_per_year
    @periods          = @years * @periods_per_year
    @delta            = 0.005
  end
  
  it "should calculate present value" do
    Stater::TVM.pv(@future_value, @interest, @years, @periods_per_year).should be_close(@present_value, @delta)
  end

  it "should calculate future value" do
    Stater::TVM.fv(@present_value, @interest, @years, @periods_per_year).should be_close(@future_value, @delta)
  end
  
  it "should calculate interest" do
    Stater::TVM.interest(@present_value, @future_value, @years, @periods_per_year).to_f.should be_close(@interest, @delta)
  end
end
