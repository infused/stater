module Stater::TVM
  class Compound
    class << self
      # Calculates the future value given pv = present value, r = annual rate, y = years, n = periods per year
      def fv(pv, r, y, n)
        pv * ((1 + (r / n))**(y * n))
      end
      
      # Calulates the present value given fv = future value, r = annual rate, y = years, n = periods per year
      def pv(fv, r, y, n)
        fv / ((1 + (r / n))**(y * n))
      end
      
      # Calculates the interest given pv = present value, fv = future value, y = years, n = periods per year
      def i(pv, fv, y, n)
        n * ((fv / pv) ** (1 / (y.to_f * n)) - 1)
      end
    
      # Calculates the number of years given the pv = present value, fv = future value, r = annual interest, n = periods per year
      def y(pv, fv, r, n)
        Math.log(fv / pv) / (n * Math.log(1 + (r / n)))
      end
    
      def i_to_apr(r, n)
        ((1 + (r / n)) ** n) - 1
      end
    
      def apr_to_i(apr, n)
        n * ((1 + apr) ** (1/n.to_f) - 1)
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