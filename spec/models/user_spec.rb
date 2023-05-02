require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should have a name' do
      @user = User.new(name: nil, email: 'testEmail@gmail.com', password: 'testPassword')
      expect(@user).to_not be_valid
    end
    it 'should have an email' do
      @user = User.new(name: 'testName', email: nil, password: 'testPassword')
      expect(@user).to_not be_valid
    end
    it 'should have a password' do
      @user = User.new(name: 'testName', email: nil, password: 'testPassword')
      expect(@user).to_not be_valid
    end
  end
end