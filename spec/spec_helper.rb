$:.unshift(File.dirname(__FILE__) + '/../lib/')
require 'rubygems'
require 'rspec'
require 'stater'
require 'nokogiri'

FIXTURE_PATH = File.dirname(__FILE__) + '/fixtures' unless defined?(DB_PATH)

module CustomMatchers
  def tvalue_schedule(xml_file)
    control_schedule = []
    doc = Nokogiri(open(File.dirname(__FILE__) + "/fixtures/tvalue_schedules/#{xml_file}"))

    (doc/:amortizationline).each do |line|
      if (line/:amortizationlinetype).inner_text == '9'
        payment           = (line/:payment1amount).inner_text.gsub(/(\d{2})\d{2}$/, '.\1')
        interest_paid     = (line/:interestpaid).inner_text.gsub(/(\d{2})\d{2}$/, '.\1')
        principal_paid    = (line/:principalpaid).inner_text.gsub(/(\d{2})\d{2}$/, '.\1')
        principal_balance = (line/:principalbalance).inner_text.gsub(/(\d{2})\d{2}$/, '.\1')
        control_schedule << Struct::Payment.new(payment.to_d, principal_paid.to_d, interest_paid.to_d, principal_balance.to_d)
      end
    end
    control_schedule
  end
end

RSpec.configure do |config|
  config.include(CustomMatchers)
end

