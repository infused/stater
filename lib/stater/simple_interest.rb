module Stater
  class SimpleInterest
    class << self
      def future_value(present_value, years, interest)
        present_value * (1 + years * interest)
      end

      alias_method :amount, :future_value
      
      def present_value(future_value, years, interest)
        future_value / (1 + years * interest)
      end
      
      alias_method :principal, :present_value
      
      def interest(present_value, future_value, years)
        ((future_value / present_value ) - 1) / years
      end
      
      def years(present_value, future_value, interest)
        ((future_value / present_value) - 1) / interest
      end
    end
  end
end
