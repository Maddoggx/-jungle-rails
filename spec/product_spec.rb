require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do 
          @category = Category.new name: 'flowers'
          @product = Product.new(
            name: 'Tiger Lily',
            price_cents: '78.95',
            quantity: 3,
            category: @category
          )
        end
    it 'should not be nil when all fields are present' do 
      # @product.save
      expect(@product).to be_valid
    end
    it 'should be nil when a name is not present' do
      @product.name = nil 
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")

    end

    it 'should be nil when price is not present' do
      @product.price_cents = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")

    end

    it 'should be nil if quantity is not present' do
      @product.quantity = nil
  
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should be nil if a category is not present' do
      @product.category = nil
      expect(@product).to_not be_valid       
      expect(@product.errors.full_messages).to include("Category must exist")
    end

  end
end