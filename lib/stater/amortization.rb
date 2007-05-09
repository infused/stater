Struct.new('Payment', :payment_number, :payment, :principal, :interest, :remaining_principal)
class NilClass
  def to_d
    nil
  end
end

module Stater
  class Amortization
    
    attr_accessor :principal
    attr_accessor :periodic_rate
    attr_accessor :periods
    
    def initialize(principal = nil, periodic_rate = nil, periods = nil)
      @schedule = []
      @principal, @periodic_rate, @periods = principal.to_d, periodic_rate.to_d, periods
    end
    
    # Calculates the payment when given the principal amount and interest rate
    def payment
      x = @periodic_rate * @principal * ((1 + @periodic_rate)**@periods)
      y = ((1 + @periodic_rate)**@periods) - 1
      result = x / y
      
      BigDecimal(result.to_s).round(2) #.to_f
    end
    
    def schedule
      # return [] if @principal.nil? or @period_rate.nil? or @periods.nil?
      
      payments = []
      pmt = payment
      remaining_principal = @principal
      payment_number = 0
      while remaining_principal > 0 do
        payment_number += 1
        
        interest = remaining_principal * @periodic_rate
        principal = pmt - interest
        remaining_principal = remaining_principal - principal
        
        payments << Struct::Payment.new(payment_number, pmt, principal, interest, remaining_principal)
      end
      payments
    end
    
    
  end
end