$:.unshift(File.dirname(__FILE__) + "/../lib/")
require 'test/unit'
require 'stater'

require 'rubygems'
require 'hpricot'

class Test::Unit::TestCase
  def assert_schedule(xml_file, schedule)
    control_schedule = []
    doc = Hpricot(open(xml_file))

    lines = (doc/:tvalueamortizationschedule/:amortizationline)
    lines.each do |line|
      if line.search(:amortizationlinetype).innerHTML == '9'
        payment           = line.search(:payment1amount).innerHTML.gsub(/(\d{2})\d{2}$/, '.\1')
        interest_paid     = line.search(:interestpaid).innerHTML.gsub(/(\d{2})\d{2}$/, '.\1')
        principal_paid    = line.search(:principalpaid).innerHTML.gsub(/(\d{2})\d{2}$/, '.\1')
        principal_balance = line.search(:principalbalance).innerHTML.gsub(/(\d{2})\d{2}$/, '.\1')
        
        control_schedule << Struct::Payment.new(nil, payment, principal_paid, interest_paid, principal_balance)
      end
    end
    
    # assert_equal control_schedule.size, schedule.size, "The number of amortization lines is not the same."
    
    schedule.each_with_index do |line, index|
      assert_equal control_schedule[index].payment, line.payment.to_s('F').gsub(/\.(\d{1})$/, '.\10').gsub(/^0/, ''),
        "payment at amortization line: #{index}"
      assert_equal control_schedule[index].interest_paid, line.interest_paid.to_s('F').gsub(/\.(\d{1})$/, '.\10').gsub(/^0/, ''),
        "interest at amortization line #{index}"
      assert_equal control_schedule[index].principal_paid, line.principal_paid.to_s('F').gsub(/\.(\d{1})$/, '.\10').gsub(/^0/, ''),
        "principal at amortization line #{index}"
      assert_equal control_schedule[index].principal_balance, line.principal_balance.to_s('F').gsub(/\.(\d{1})$/, '.\10').gsub(/^0/, ''),
        "principal_balance at amortization line #{index}"
    end
  end
end
