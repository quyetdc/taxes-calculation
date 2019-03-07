require_relative '../helpers/reader.rb'
require_relative '../models/order.rb'

# Receipts Controller class
# To read the input csv and to print out the terminal
class Receipts
  def initialize(file_path)
    @file = file_path
    @order = nil
    assign_order
  end

  def assign_order
    inputs = Reader.input @file
    goods = inputs.map do |input|
      Good.new(input[:quantity], input[:product], input[:price])
    end
    @order = Order.new goods
    @order.invoke
  end

  def invoke
    puts "\n"
    @order.goods.each do |good|
      puts "#{good.quantity}, #{good.name}, #{format('%.2f', good.shelf_price)}"
    end
    puts "Sales Taxes: #{format('%.2f', @order.total_taxes)}"
    puts "Total: #{format('%.2f', @order.total_sales)}"
    puts "\n"
  end
end
