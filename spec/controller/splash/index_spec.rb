require 'rails_helper'
require_relative '../spec_support_helpers'

RSpec.describe Categorie, type: :system do
  describe 'test display' do
    it 'should display splash page' do
      visit '/'
      expect(page).to have_content("SpendWise")
      expect(page).to have_content("Register")
      expect(page).to have_content("Log in")
    end
  end

  describe 'test button interaction' do
    it 'btn register should redirect to register page' do
      visit '/'
      click_link "Register"
      expect(page).to have_content("Sign up")
    end

    it 'btn login should redirect to login page' do
      visit '/'
      click_link "Log in"
      expect(page).to have_content("Log In")
    end

  end
end