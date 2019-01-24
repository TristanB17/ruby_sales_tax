require 'bigdecimal'
require 'pry'

class Price
  attr_reader :amount,
              :sales_tax

  def initialize(amount)
    @amount = BigDecimal.new(amount).round(2)
    @sales_tax = BigDecimal.new(0)
  end

  def add_tax(type = 'non_exempt')
    percentage = (type == 'non_exempt' ? (amount/BigDecimal.new('10')).round(2) : (amount/BigDecimal.new('20')).round(2))
    tax = ((percentage * BigDecimal.new('20')).round(2) / BigDecimal.new('20')).round(2)
    @sales_tax += tax
  end
end
