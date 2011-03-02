# encoding: utf-8

module Stater
  class TVM
    include Math
    
    class << self
      # Calculates the future value
      #   pv = present value
      #   i = simple interest rate
      #   n = number of years
      #   m = compounding periods per year
      def fv(pv, i, n, m)
        pv * (1 + (i/m)) ** (n*m)
      end
      
      # Calulates the present value
      #   fv = future value
      #   i = periodic interest rate
      #   n = number of years
      #   m = compounding periods per year
      def pv(fv, i, n, m)
        fv / (1 + (i/m)) ** (n*m)
      end
      
      # Calculates the nomical interest rate
      #   pv = present value
      #   fv = future value
      #   y = years
      #   n = compounding periods per year
      def i(pv, fv, y, n)
        n * ((fv / pv) ** (1 / (y.to_f * n)) - 1)
      end
    
      # Calculates the number of years
      #   pv = present value
      #   fv = future value
      #   r = nominal interest rate
      #   n = compounding periods per year
      def y(pv, fv, r, n)
        Math.log(fv / pv) / (n * Math.log(1 + (r / n)))
      end
    
      # Converts the nomical interest rate to APR (annual percentage rate)
      #   r = nominal interest rate
      #   n = compounding periods per year
      def i_to_apr(r, n)
        ((1 + (r / n)) ** n) - 1
      end
    
      # Converts APR (annual percentage rate) to the nomical interest rate
      #   apr = annual percentage rate
      #   n = compounding periods per year
      def apr_to_i(apr, n)
        n * ((1 + apr) ** (1/n.to_f) - 1)
      end
      
      # Converts EAR (effective annual rate) to APR (annual percentage rate)
      #   apr = annual percentage rate
      #   n = compounding periods per year
      def apr_to_ear(apr, n)
        ((1 + apr / n)**n) - 1
      end
      
      # Converts APR (annual percentage rate) to EAR (effective annual rate)
      #   ear = effective annual rate
      #   n = compounding periods per year
      def ear_to_apr(ear, n)
        n * ((1 + ear)**(1 / n.to_f) - 1)
      end
      
      alias_method :present_value, :pv
      alias_method :future_value, :fv
      alias_method :interest, :i
      alias_method :years, :y
      alias_method :annual_interest_to_apr, :i_to_apr
      alias_method :apr_to_annual_interest, :apr_to_i
    end
  end
end