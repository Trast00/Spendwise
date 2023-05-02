require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'Validations' do
    it 'should have a name' do
      @payment = Payment.new(name: nil)
      expect(@payment).to_not be_valid
    end
    it 'should have a price' do
      @payment = Payment.new(amount: nil)
      expect(@payment).to_not be_valid
    end
    it 'should have a user' do
      @payment = Payment.new(user: nil)
      expect(@payment).to_not be_valid
    end
  end
end