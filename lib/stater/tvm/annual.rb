module Stater
  module TVM
    module Annual
   
      # Present value of a future sum
      #
      # The present value formula is the core formula for the time value of money; each of the other formulae is derived from this
      # formula. For example, the annuity formula is the sum of a series of present value calculations. The present value (PV) formula
      # has four variables, each of which can be solved for:
      # pv is the value at time = 0
      # fv is the value at time = n
      # r is the rate at which the amount will be compounded each period
      # n is the number of periods
      def pv(fv, r, n)
        fv / (1 + r)**n
      end
   
      # Future value of a present sum
      def fv(pv, r, n)
        pv * (1 + r)**n
      end
    
      # Present value of an annuity
      
    end
  end
end