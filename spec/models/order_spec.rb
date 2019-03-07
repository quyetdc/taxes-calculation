require 'spec_helper'
require 'pry-byebug'
require_relative '../../models/order.rb'

RSpec.describe Order do
  before(:all) do
    book = Good.new(1, 'book', 12.49)
    food = Good.new(1, 'chocolate bar', 0.85)
    music_cd = Good.new(1, 'music cd', 14.99)
    @order = Order.new([book, food, music_cd])
    @order.invoke
  end

  describe 'should include many Goods' do
    it { expect(@order.goods.length).to eql(3) }
  end

  describe 'should have calculated sales tax' do
    it { expect(@order.total_taxes).to eql(1.50) }
  end

  describe 'should have calculated sales price' do
    it { expect(@order.total_sales).to eql(29.83) }
  end
end
