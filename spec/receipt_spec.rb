require './lib/receipt'

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
      expected_1 = '1 book at 12.49'
      expected_2 = '1 music CD at 14.99'
      expected_3 = '1 chocolate bar at 0.85'

      expect(receipt.list.length).to eq(3)
      expect(receipt.list[0]).to eq(expected_1)
      expect(receipt.list[1]).to eq(expected_2)
      expect(receipt.list[2]).to eq(expected_3)
    end
  end
end
