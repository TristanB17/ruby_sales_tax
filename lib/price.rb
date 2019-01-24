require 'bigdecimal'

class Price
  attr_reader :amount,
              :sales_tax

  def initialize(amount)
    @amount = BigDecimal.new(amount).round(2)
    @sales_tax = 0
  end



  def add_non_exempt_tax
    percentage = amount / 10
    non_exempt_tax = ((percentage * 20).round / 20.0)
    @sales_tax += non_exempt_tax
  end

  def add_import_tax
    percentage = amount / 20
    import_tax = ((percentage * 20).round / 20.0)
    @sales_tax += import_tax
  end
end
