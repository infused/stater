Struct.new('Payment', :payment_number, :payment, :principal, :interest, :principal_balance)

class NilClass
  def to_d
    nil
  end
end

# TODO: test that this actually works
# BigDecimal.mode(BigDecimal::ROUND_HALF_EVEN)

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
    def calculate_payment
      x = @periodic_rate * @principal * ((1 + @periodic_rate)**@periods)
      y = ((1 + @periodic_rate)**@periods) - 1
      result = x / y
      
      BigDecimal(result.to_s).round(2) #.to_f
    end
    
    def schedule
      return [] if @principal.nil? or @periodic_rate.nil? or @periods.nil?
      
      payments = []
      pmt = calculate_payment
      principal_balance = @principal
      # p "payment, principal, interest, balance"
      1.upto(@periods) do |payment_number|
        interest_paid = (principal_balance * @periodic_rate).round(2)
        principal = pmt - interest_paid
        principal_balance = principal_balance - principal
        
        # p "#{pmt.to_s('F')}, #{principal.to_s('F')}, #{interest_paid.to_s('F')}, #{principal_balance.to_s('F')}"
        payments << Struct::Payment.new(payment_number, pmt, principal.round(2), interest_paid, principal_balance.round(2))
      end
      payments
    end
    
  end
end