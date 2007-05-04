module Stater
  class Amortization
    
    class << self
      # Calculates the payment when given the principal amount and interest rate
      def payment_amount(principal_amount, interest_rate, number_of_payments)
        x = interest_rate * principal_amount * ((1 + interest_rate) ** number_of_payments)
        y = ((1 + interest_rate) ** number_of_payments) - 1
        return BigDecimal((x / y).to_s).round(2).to_f
      end
    
      # Calculates the principal when given the periodic payment and interest rate
      def principal(payment_amount, interest_rate, number_of_payments)
      
      end
    
      # Calculates the annual interest rate when given the principal amount and periodic payment
      def interest(principal_amount, payment_amount, number_of_payments)
      
      end
    end
    
  end
end