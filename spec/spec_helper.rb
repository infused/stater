$:.unshift(File.dirname(__FILE__) + '/../lib/')
require 'rubygems'
require 'rspec'
require 'stater'
require 'nokogiri'

module CustomMatchers
  def load_tvalue_schedule(xml_file)
    control_schedule = []
    doc = Nokogiri(open(File.dirname(__FILE__) + "/fixtures/tvalue_schedules/#{xml_file}"))

    (doc/:amortizationline).each do |line|
      if (line/:amortizationlinetype).inner_text == '9'
        payment = extract_value(line, :payment1amount).to_d
        interest_paid = extract_value(line, :interestpaid).to_d
        principal_paid = extract_value(line, :principalpaid).to_d
        principal_balance = extract_value(line, :principalbalance).to_d

        control_schedule << Struct::Payment.new(payment, principal_paid, interest_paid, principal_balance)
      end
    end

    control_schedule
  end

  def extract_value(line, name)
    (line/name.to_sym).inner_text.gsub(/(\d{2})\d{2}$/, '.\1')
  end
end

RSpec.configure do |config|
  config.include(CustomMatchers)
end

