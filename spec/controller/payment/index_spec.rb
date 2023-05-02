require 'rails_helper'
require_relative '../spec_support_helpers'

RSpec.describe Payment, type: :system do
  before(:all) do
    user = authentificate_test_user
    @categorie = Categorie.first
    @categorie ||= Categorie.create(name: 'test', icon: 'testImg', user: user)
    @payments = Payment.all
    if (@payments.length == 0)
      Payment.create(name: 'test', amount: 17, user: user, categorie_id: @categorie.id)
      Payment.create(name: 'test2', amount: 18, user: user, categorie_id: @categorie.id)
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

  describe 'test button interaction payment' do
    before(:each) do
      authentificate_test_user
      expect(page).to have_content('Signed')
      visit "categories/#{@categorie.id}/payments"
    end

    it 'btn back should redirect to categories in page' do
      click_link(class: "btn-back")
      expect(page).to have_content('Transactions')
    end

    it 'btn add payment should redirect to new payment page' do
      click_link "New Payment"
      expect(page).to have_content("New Payment")
    end
  end
end