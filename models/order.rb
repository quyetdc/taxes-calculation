require_relative 'good'

# Object class for Order
# Basically, order can have many goods
# After invoking, Order's total price & taxes will be calculated
class Order
  attr_reader :total_sales, :total_taxes, :goods

  def initialize(goods)
    @goods = goods
    @total_sales = 0.0
    @total_taxes = 0.0
  end

  def invoke
    @goods.each do |good|
      good.invoke
      @total_taxes += good.quantity * good.tax_amount
      @total_sales += good.quantity * good.shelf_price
    end

    @total_taxes = @total_taxes.round(2)
    @total_sales = @total_sales.round(2)
  end
end
