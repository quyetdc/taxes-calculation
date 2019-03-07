require 'spec_helper'
require_relative '../../models/good.rb'

RSpec.shared_examples 'An Exempt' do
  describe 'Tax' do
    it { expect(object.tax_amount).to eql(0.0) }
    it { expect(object.type).to eql(Tax::EXEMPT) }
    it { expect(object.tax_rate).to eql(Tax::EXEMPT_RATE) }
    it { expect(object.tax_rate).to eql(Tax::EXEMPT_RATE) }
  end

  describe 'Shelf price' do
    it { expect(object.shelf_price).to eql(object.price) }
  end
end

describe 'Attributes' do
  let(:book) { Good.new(1, 'book', 12.49) }

  %I[price shelf_price tax_rate tax_amount quantity name].each do |attr|
    it { expect(book).to respond_to(attr) }
  end
end

describe 'Exempts' do
  context 'Book' do
    it_behaves_like 'An Exempt' do
      book = Good.new(1, 'book', 12.49)
      book.invoke
      let(:object) { book }
    end
  end

  context 'Food' do
    it_behaves_like 'An Exempt' do
      food = Good.new(1, 'chocolate bar', 0.85)
      food.invoke
      let(:object) { food }
    end
  end

  context 'Medicine' do
    it_behaves_like 'An Exempt' do
      medicine = Good.new(1, 'packet of headache pills', 9.75)
      medicine.invoke
      let(:object) { medicine }
    end
  end
end

describe 'Imported Exempt' do
  it 'is pending'
end

describe 'Basics' do
  it 'is pending'
end

describe 'Imported Basics' do
  it 'is pending'
end
