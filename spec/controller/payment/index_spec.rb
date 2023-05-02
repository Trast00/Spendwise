require 'rails_helper'
require_relative '../spec_support_helpers'

RSpec.describe Payment, type: :system do
  before(:all) do
    @categorie = Categorie.first
    @categorie ||= Categorie.create(name: 'test', icon: 'testImg', user: User.first)
    @payments = Payment.all
    if (@payments.length == 0)
      Payment.create(name: 'test', amount: 17, user: User.first, categorie_id: @categorie.id)
      Payment.create(name: 'test2', amount: 18, user: User.first, categorie_id: @categorie.id)
    end
    @payments = Payment.all
  end

  describe 'test display payments' do
    before(:each) do
      authentificate_test_user
      expect(page).to have_content('Signed')
      visit "categories/#{@categorie.id}/payments"
    end

    it 'should display payments' do
      expect(page).to have_content('Payment')
      expect(page).to have_content('TOTAL PAYMENT')
      expect(page).to have_content(@categorie.total_amount)
    end

    it 'should display categorie' do
      expect(page).to have_content(@categorie.name)
    end

    it 'should display list of payment with amount' do
      @payments.each do |payment|
        name = "Transaction N°: #{payment.id}"
        expect(page).to have_content(name)
        expect(page).to have_content(payment.updated_at)
      end
    end
  end
end