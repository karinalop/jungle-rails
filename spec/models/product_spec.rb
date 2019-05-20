require 'rails_helper'

RSpec.describe Product, type: :model do
 describe 'Validations' do
    # validation tests/examples here
    it "is valid with name, price, quantity and category" do
      cat1 = Category.find_or_create_by! name: 'Pet'
      prod = Product.new(
        name: 'Happy Cat',
        price: 3000,
        quantity: 20,
        category: cat1
      )
      expect(prod).to be_valid
    end

    it "is not valid without a name" do
      cat1 = Category.find_or_create_by! name: 'Pet'
      prod = Product.new(
        name: nil,
        price: 3000,
        quantity: 20,
        category: cat1
      )
      expect(prod).to_not be_valid
    end

    it "is not valid without a price" do
      cat1 = Category.find_or_create_by! name: 'Pet'
      prod = Product.new(
        name: 'Happy Cat',
        price: nil,
        quantity: 20,
        category: cat1
      )
      expect(prod).to_not be_valid
    end

    it "is not valid without a quantity" do
      cat1 = Category.find_or_create_by! name: 'Pet'
      prod = Product.new(
        name: 'Happy Cat',
        price: 3000,
        quantity: nil,
        category: cat1
      )
      expect(prod).to_not be_valid
    end

    it "is not valid without a category" do
      cat1 = Category.find_or_create_by! name: 'Pet'
      prod = Product.new(
        name: 'Happy Cat',
        price: 3000,
        quantity: 20,
        category: nil
      )
      expect(prod).to_not be_valid
    end
  end
end

