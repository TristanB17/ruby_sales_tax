require './lib/receipt'
require 'pry'

describe 'a receipt' do
  context 'importing from a txt file' do
    it 'initializes with an array of strings separated by linebreaks' do
      receipt = Receipt.new("./test_receipt.txt")
      expected_1 = '1 book at 12.49'
      expected_2 = '1 music CD at 14.99'
      expected_3 = '1 chocolate bar at 0.85'

      expect(receipt.list.length).to eq(3)
      expect(receipt.list[0]).to eq(expected_1)
      expect(receipt.list[1]).to eq(expected_2)
      expect(receipt.list[2]).to eq(expected_3)
    end
  end
  context 'creates' do
    it 'creating hash object of item objects' do
      receipt = Receipt.new("./test_receipt.txt")
      expected_list_length = 3
      expected_name = 'book'
      expected_total_price = 16.49

      organized_list = receipt.organize_list_items

      expect(organized_list.length).to eq(expected_list_length)
      expect(organized_list[0].name).to eq(expected_name)
      expect(organized_list[1].total_price).to eq(expected_total_price)
    end
    it 'creating finds total price and sales tax of receipt' do
      receipt = Receipt.new("./test_receipt.txt")
      expected_list_total_cost = 29.83
      expected_list_total_sales_tax = 1.50

      expect(receipt.receipt_total_price).to eq(expected_list_total_cost)
      expect(receipt.receipt_total_tax).to eq(expected_list_total_sales_tax)
    end
    it 'prints all receipt information' do
      receipt = Receipt.new("./test_receipt.txt")




    end
  end
end
