require './lib/item'

describe 'an item' do
  context 'initialization' do
    it 'initializes with name, quantity and price object' do
      item = Item.new('1 book at 12.49')
      book_price = 12.49
      item_quantity = 1
      item_name = 'book'
      item_sales_tax = 0

      expect(item.quantity).to eq(item_quantity)
      expect(item.name).to eq(item_name)
      expect(item.price.amount).to eq(book_price)
      expect(item.price.sales_tax).to eq(item_sales_tax)
    end
  end
  context 'adding tax' do
    it 'determines if item is tax exempt' do
      item = Item.new('1 book at 12.49')
      expected_tax_exemption = nil

      expect(item.check_for_non_exemption).to eq(expected_tax_exemption)
    end
    it 'determines if item is not tax exempt' do
      item = Item.new('1 goldboi at 12.49')
      expected_tax_exemption = true

      expect(item.check_for_non_exemption).to eq(expected_tax_exemption)
    end
    it 'determines if item is imported' do
      item = Item.new('1 imported rabbit at 12.49')
      expected_tax = true

      expect(item.check_for_import).to eq(expected_tax)
    end
    it 'adds tax to non-exempt and imported items' do
      item = Item.new('1 imported bottle of perfume at 27.99')
      expected_total = 32.19

      item.get_totals

      expect(item.total_price.to_f).to eq(expected_total)
    end
    it 'accounts for quantity' do
      item = Item.new('2 imported bottles of perfume at 27.99')
      expected_total = 64.38
      expected_sales_tax = 8.40

      item.get_totals

      expect(item.total_price.to_f).to eq(expected_total)
      expect(item.total_sales_tax.to_f).to eq(expected_sales_tax)
    end
  end
end
