require_relative 'item.rb'
require 'pry'

class Receipt
  attr_reader :list

  def initialize(filepath)
    @list = File.read(filepath).split("\n")
  end

  def organize_list_items
    @list.map do |line|
      new_item = Item.new(line)
      new_item.get_totals
      new_item
    end
  end

  def organized_list
    @organized_list ||= organize_list_items
  end

  def receipt_total_price
    organized_list.inject(0) { |sum, item| sum += item.total_price }.to_f
  end

  def receipt_total_tax
    organized_list.inject(0) { |sum, item| sum += item.total_sales_tax }.to_f
  end

  def formatted_item(item)
    "#{item.quantity.to_i} #{item.name}: #{item.total_price.to_f.to_s}\n"
  end

  def print_receipt
    formatted_items = "\n"
    organized_list.each do |item|
      formatted_items << formatted_item(item)
    end
    formatted_items << "Sales Taxes: #{'%.2f' % receipt_total_tax}\n"
    formatted_items << "Total: #{receipt_total_price.to_s}\n\n"
    print formatted_items
  end
end
