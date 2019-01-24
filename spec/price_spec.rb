require './lib/price'
require 'pry'

describe 'an item price' do
  context 'initialization' do
    it 'starts with amount, and zero sales tax' do
      starting_price = '27.99'
      sales_tax = 0
      price = Price.new(starting_price)

      expect(price.amount.to_f).to eq(starting_price.to_f)
      expect(price.sales_tax.to_f).to eq(sales_tax.to_f)
    end
  end
  context 'instance methods' do
    it 'calculates sales tax' do
      starting_price = '27.99'
      ending_price = '30.79'
      test_non_exempt_tax = '2.80'
      price = Price.new(starting_price)

      price.add_tax

      expect(price.sales_tax.to_f).to eq(test_non_exempt_tax.to_f)
    end
    it 'calculates import tax' do
      starting_price = '27.99'
      ending_price = '29.39'
      test_import_tax = '1.40'
      price = Price.new(starting_price)

      price.add_tax('import')

      expect(price.sales_tax.to_f).to eq(test_import_tax.to_f)
    end
    it 'calculates to the nearest fifth' do
      starting_price = '18.99'
      ending_price = '20.89'
      test_import_tax = '1.90'
      price = Price.new(starting_price)

      price.add_tax

      expect(price.sales_tax.to_f).to eq(test_import_tax.to_f)
    end
  end
end
