require 'rails_helper'
require_relative '../spec_support_helpers'

RSpec.describe Payment, type: :system do
  before(:all) do
    user = authentificate_test_user
    @categorie = Categorie.first
    @categorie ||= Categorie.create(name: 'test', icon: 'testImg', user: user)
  end
  describe 'test display payement#new' do
    before(:each) do
      authentificate_test_user
      expect(page).to have_content('Signed')
      visit "/categories/#{@categorie.id}/payments/new"
    end

    it 'should display new categorie page' do
      expect(page).to have_content('New Payment')
    end

    it 'should display error message on submit form without email' do
      fill_in "Payment's Name*", with: 'testNew'
      fill_in "Amount*", with: ""
      click_button 'Create Payment'
      # as there is error, it's stay on the page
      expect(page).to have_content('New Payment')
    end

    it 'amount cannot be smaller than 0' do
      fill_in "Payment's Name*", with: 'testNew'
      fill_in "Amount*", with: -20
      click_button 'Create Payment'
      # as there is error, it's stay on the page
      expect(page).to have_content('New Payment')
    end

    it 'should submit form' do
      fill_in "Payment's Name*", with: 'testNew'
      fill_in "Amount*", with: 100
      click_button 'Create Payment'
      expect(has_current_path?("/categories/#{@categorie.id}/payments", wait: 5)).to be_truthy
    end
  end
end
      