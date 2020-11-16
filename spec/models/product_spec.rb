require 'rails_helper'
require 'product'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    # validation tests/examples here
    it 'validates name is present' do 
      @category = Category.new(name: 'test cat')
      @product1 = Product.new(name:'test1 name', price_cents:3000, quantity: 5, category_id: 1)
      @product1.save
      expect(@product1.name).to be_present
      # expect(1).to eql(1)
    end
    it 'validates price is present' do 
      @category = Category.new(name: 'test cat')
      @product2 = Product.new(name:'test2 name', price_cents:3000, quantity: 5, category_id: 1)
      @product2.save
      expect(@product2.price_cents).to be_present    
    end
    it 'validates quantity is present' do
      @category = Category.new(name: 'test cat')
      @product3 = Product.new(name:'test3 name', price_cents:3000, quantity: 5, category_id: 1)
      @product3.save
      expect(@product3.quantity).to be_present
    end
    it 'validates category is present' do
      @category = Category.new(name: 'test cat')
      @product4 = Product.new(name:'test4 name', price_cents:3000, quantity: 5, category_id: 1)
      @product4.save
      expect(@product4.category_id).to be_present 
    end
    it 'has error' do 
    @product5 = Product.new
    @product5.save
    expect(@product5.errors.full_messages).to be_present
    end

  end
end
