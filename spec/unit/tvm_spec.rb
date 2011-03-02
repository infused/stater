require File.dirname(__FILE__) + '/../spec_helper'

describe Stater::TVM do
  before(:each) do
    @present_value    = 6000.00
    @future_value     = 7935.08
    @interest         = 0.04
    @years            = 7
    @periods_per_year = 12
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
  
  it "should caculate years" do
    Stater::TVM.years(@present_value, @future_value, @interest, @periods_per_year).should be_close(@years, @delta)
  end
  
  it "should convert simple interest to APR" do
    Stater::TVM.i_to_apr(0.18, 12).should be_close(0.195, @delta)
  end
  
  it "should convert APR to simple interest" do
    Stater::TVM.apr_to_i(0.195, 12).should be_close(0.179, @delta)
  end
  
  it "should convert APR to EAR" do
     Stater::TVM.apr_to_ear(0.129, 12).should be_close(0.137, @delta)
  end
  
  it "should convert EAR to APR" do
    Stater::TVM.ear_to_apr(0.138, 12).should be_close(0.129, @delta)
  end
end