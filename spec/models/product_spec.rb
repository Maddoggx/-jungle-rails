require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do 
          @category = Category.new name: 'flowers'
        end
          @product = Product.new 
    it 'should check that a name is present' do
      @category = Category.new(name: 'Category')
      @product = Product.new(name: 'Name', quantity: 3, price: 1499, category: @category)
      expect(@product).to be_valid
    end

    it 'should check that a name is not nil' do
      @category = Category.new(name: 'Category')
      @product = Product.new(name: nil, quantity: 3, price: 1499, category: @category)
      expect(@product).to_not be_valid
    end

    it 'should check that a price is not nil' do
      @category = Category.new(name: 'Category')
      @product = Product.new(name: 'Name', quantity: 3, price: '', category: @category)
      expect(@product).to_not be_valid
    end

    it 'should check that a quantity is not nil' do
      @category = Category.new(name: 'Category')
      @product = Product.new(name: 'Name', quantity: nil, price: 1499, category: @category)
      expect(@product).to_not be_valid
    end

    it 'should check that a category is not nil' do
      @product = Product.new(name: 'Name', quantity: 3, price: 1499, category: nil)
      expect(@product).to_not be_valid          
    end

    it 'should check that an error message is generated when an attribute is set to nil' do
      @product = Product.new(name: 'Name', description: 'Description', image: 'plante_12.jpg', quantity: 3, price: 1499, category: nil)
      expect(@product).to_not be_valid 
      expect(@product.errors.full_messages).to_not be_empty
    end

  end
ends
# describe 'Validations' do
#   # validation tests/examples here
#   before(:each) do 
#     @category = Category.new name: 'flowers'
#   end
#     it 'should have a name' do 
#   @product = Product.new(name: "lillie", price:1299, quantity: 5, category: @category)
#   @product.validate
#   expect(@product).to be_present
#     end