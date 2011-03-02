# encoding: utf-8

Struct.new('Payment', :payment, :principal_paid, :interest_paid, :principal_balance)

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
      (x / y).round(2)
    end
    
    def schedule
      return [] if @principal.nil? or @periodic_rate.nil? or @periods.nil?
      
      payments = []
      payment = calculate_payment
      principal_balance = @principal

      1.upto(@periods) do |payment_number|
        interest_paid = (principal_balance * @periodic_rate).round(2)
        principal_paid = payment - interest_paid
        principal_balance = principal_balance - principal_paid
        
        payments << Struct::Payment.new(payment, principal_paid, interest_paid, principal_balance)
      end
      
      payments
    end
    
  end
end