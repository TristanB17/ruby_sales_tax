require './lib/price'
require 'pry'

describe 'an item price' do
  context 'initialization' do
    it 'starts with amount, and zero sales tax' do
      starting_price = '27.99'
      sales_tax = 0
      price = Price.new(starting_price)
      binding.pry
      expect(price.amount).to eq(starting_price)
      expect(price.sales_tax).to eq(sales_tax)
    end
  end
  context 'instance methods' do
    it 'calculates sales tax' do
      starting_price = 27.99
      ending_price = 30.79
      test_non_exempt_tax = 2.80
      price = Price.new(starting_price)

      price.add_non_exempt_tax

      expect(price.sales_tax).to eq(test_non_exempt_tax)
    end
    it 'calculates import tax' do
      starting_price = 27.99
      ending_price = 29.39
      test_import_tax = 1.40
      price = Price.new(starting_price)

      price.add_import_tax

      expect(price.sales_tax).to eq(test_import_tax)
    end
  end
end
