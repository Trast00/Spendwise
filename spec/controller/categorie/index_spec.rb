require 'rails_helper'
require_relative '../spec_support_helpers'

RSpec.describe Categorie, type: :system do
  before(:all) do
    user = authentificate_test_user
    @categories = Categorie.all
    if @categories.empty?
      Categorie.create(name: 'test', icon: 'testImg', user:)
      Categorie.create(name: 'test2', icon: 'testImg2', user:)
    end
    @categories = Categorie.all
  end
  describe 'test display categories' do
    before(:each) do
      authentificate_test_user
      expect(page).to have_content('Signed')
    end

    it 'should display categories' do
      visit '/categories'
      expect(page).to have_content('Transactions')
      expect(page).to have_content('Total amount')
      expect(page).to have_content(Categorie.total_amount(@categories))
    end

    it 'should display list of categorie with amount' do
      @categories.each do |categorie|
        expect(page).to have_content(categorie.name)
        expect(page).to have_content(categorie.total_amount)
      end
    end
  end

  describe 'test button interaction categorie' do
    before(:each) do
      authentificate_test_user
      expect(page).to have_content('Signed')
    end
    it 'btn log out should redirect to root in page' do
      visit '/categories'
      click_button(id: 'btn-logout')
      expect(page).to have_content('Log in')
    end

    it 'btn add categorie should redirect to new categorie page' do
      visit '/categories/new'
      click_link 'New Category'
      expect(page).to have_content('New Category')
    end
  end
end
