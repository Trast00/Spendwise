require 'rails_helper'
require_relative '../spec_support_helpers'

RSpec.describe Categorie, type: :system do
  describe 'test display categories#new' do
    before(:each) do
      authentificate_test_user
      expect(page).to have_content('Signed')
    end

    it 'should display new categorie page' do
      visit '/categories/new'
      expect(page).to have_content('New Category')
    end

    it 'should display error message on submit form without email' do
      visit '/categories/new'
      fill_in "Category's Name*", with: 'testNew'
      click_button 'Create Category'
      # as there is error, it's stay on the page
      expect(page).to have_content('New Category')
    end

    it 'should submit form' do
      visit '/categories/new'
      fill_in "Category's Name*", with: 'testNew'
      fill_in "Icon URL*", with: 'testImgNew'
      click_button 'Create Category'
      expect(has_current_path?('/categories/new', wait: 5)).to be_truthy
    end

  end
end