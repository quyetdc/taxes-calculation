require_relative '../helpers/reader.rb'
require_relative '../models/order.rb'

# Receipts Controller class
# To read the input csv and to print out the terminal
class Receipts
  def initialize(file_path)
    @file = file_path
    @order = nil
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
    assign_order

    puts "\n"
    @order.goods.each do |good|
      puts "#{good.quantity}, #{good.name}, #{good.shelf_price}"
    end
    puts "Sales Taxes: #{@order.total_taxes}"
    puts "Total: #{@order.total_sales}"
    puts "\n"
  end
end
