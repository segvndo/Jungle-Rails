require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it "should be valid with all fields present" do
      @category = Category.new(name: "test")
      @product = Product.new(name: "test", price_cents: 100, quantity: 1, category: @category)
      expect(@product).to be_valid
    end

    it 'should have a name' do
      @category = Category.new(name: "test")
      @product = Product.new(name: nil, price_cents: 100, quantity: 1, category: @category)
      @product.save

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should have a price' do
      @category = Category.new(name: "test")
      @product = Product.new(name: "test", price_cents: nil, quantity: 1, category: @category)
      @product.save
      
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should have a quantity' do
      @category = Category.new(name: "test")
      @product = Product.new(name: "test", price_cents: 100, quantity: nil, category: @category)
      @product.save

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should have a category' do
      @category = Category.new(name: "test")
      @product = Product.new(name: "test", price_cents: 100, quantity: nil, category: nil)
      @product.save

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
