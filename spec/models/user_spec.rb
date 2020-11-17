require 'rails_helper'
require 'user.rb'
RSpec.describe User, type: :model do

  describe 'Validations' do
    it "must be created with pass and confirmation fields" do
      @user1 = User.new
      @user1.save
      expect(@user1.errors.full_messages).to be_present
    end
    
    it "should not be case sensitive" do
      @user1 = User.new(email: 'TEST1@test.ca', name:'asd', password:'12345678910')
      @user1.save
      @user = User.find_by(email: 'test1@test.ca')
      expect('asd').to eql(@user.name)
    end

    it "should have email, first name, last name required" do
      @user1 = User.new
      @user1.save
      expect(@user1.errors.full_messages).to be_present
    end
    it "should have password min length when acc created" do
      @res = User.new(email: 'test@test.ca', password: 'asdf', name:'name').valid?
      expect(@res).to eql(false)
    end
    it "must be unique" do
      @user1 = User.new(email: 'test@test.ca', name:'asd', password:'12345678910')
      @user1.save
      @res = User.authenticate_with_credentials 'test@test.ca', 'asd'
      expect(@res).to eql(nil)
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "should login for authenticated users" do
      @user1 = User.new(email: 'test@test.ca', name:'asd', password:'12345678910')
      @user1.save

      @res = User.authenticate_with_credentials('test@test.ca', '12345678910')
      expect(@res).to eql(@user1)
    end

    
  end
end
