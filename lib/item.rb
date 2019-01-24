require_relative 'price.rb'

class Item
  def initialize(string)
    @base_string = string.split(' ')
  end

  def quantity
    @quantity ||= BigDecimal.new(@base_string[0])
  end

  def name
    @name ||= @base_string[1...-1].join(' ')
  end

  def price
    @price ||= Price.new(@base_string[-1])
  end

  def total_price
    @total_price || get_total_price
  end

  def total_sales_tax
    @total_sales_tax || price.sales_tax * quantity
  end

  def get_total_price
    price.add_tax if check_for_non_exemption
    price.add_tax('import') if check_for_non_exemption
    (price.amount + price.sales_tax) * quantity
  end

  def check_for_non_exemption
    return true if exemption_dictionary.none? { |word| name.include?(word) }
  end

  def check_for_import
    return true if name.include?('import')
  end

  def exemption_dictionary
    ['book', 'chocolate', 'pill', 'medical', 'food']
  end
end
