$:.unshift(File.dirname(__FILE__) + '/../lib/')
require 'rubygems'
require 'rspec'
require 'stater'
require 'hpricot'

FIXTURE_PATH = File.dirname(__FILE__) + '/fixtures' unless defined?(DB_PATH)

module CustomMatchers
  def tvalue_schedule(xml_file)
    control_schedule = []
    doc = Hpricot(open(File.dirname(__FILE__) + "/fixtures/tvalue_schedules/#{xml_file}"))

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
    control_schedule
  end
end

RSpec.configure do |config|
  config.include(CustomMatchers)
end

