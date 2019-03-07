require 'spec_helper'
require_relative '../../controllers/receipts.rb'

describe 'first bundle input' do
  before(:all) do
    file = File.join(File.dirname(__FILE__), '../../assets/inputs/input1.csv')
    @receipt = Receipts.new(file)
  end

  it 'Just want to see' do
    expect { @receipt.invoke }.to output("\n1, book, 12.49" \
                                         "\n1, music cd, 16.49" \
                                         "\n1, chocolate bar, 0.85" \
                                         "\nSales Taxes: 1.50" \
                                         "\nTotal: 29.83\n\n").to_stdout
  end
end

describe 'second bundle input' do
  before(:all) do
    file = File.join(File.dirname(__FILE__), '../../assets/inputs/input2.csv')
    @receipt = Receipts.new(file)
  end

  it 'Just want to see' do
    expect { @receipt.invoke }.to output(
      "\n1, imported box of chocolates, 10.50" \
      "\n1, imported bottle of perfume, 54.65" \
      "\nSales Taxes: 7.65" \
      "\nTotal: 65.15\n\n"
    ).to_stdout
  end
end

describe 'third bundle input' do
  before(:all) do
    file = File.join(File.dirname(__FILE__), '../../assets/inputs/input3.csv')
    @receipt = Receipts.new(file)
  end

  it 'Just want to see' do
    expect { @receipt.invoke }.to output(
      "\n1, imported bottle of perfume, 32.19" \
      "\n1, bottle of perfume, 20.89" \
      "\n1, packet of headache pills, 9.75" \
      "\n1, imported box of chocolates, 11.85" \
      "\nSales Taxes: 6.70" \
      "\nTotal: 74.68\n\n"
    ).to_stdout
  end
end
