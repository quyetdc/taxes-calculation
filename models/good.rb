require_relative '../helpers/tax'
require_relative '../helpers/float_round'

# Object class for Good
# After invoking Good's shelf_price & tax will be calculated
class Good
  include Tax

  attr_reader :price,
              :shelf_price,
              :type,
              :tax_rate,
              :tax_amount,
              :quantity,
              :name

  def initialize(quantity, name, price)
    @quantity = quantity
    @name = name
    @price = price
    @type = ''
    @shelf_price = 0.0
    @tax_rate = 0.0
    @tax_amount = 0.0
  end

  def invoke
    @type = get_type @name
    @tax_rate = get_rate @type
    @tax_amount = FloatRound.round(@tax_rate * @price)
    @shelf_price = (@price + @tax_amount).round(2)
  end
end
