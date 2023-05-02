require 'rails_helper'

RSpec.describe Categorie, type: :model do
  describe 'Validations' do
    it 'should have a name' do
      @categorie = Categorie.new(name: nil)
      expect(@categorie).to_not be_valid
    end
    it 'should have an icon' do
      @categorie = Categorie.new(icon: nil)
      expect(@categorie).to_not be_valid
    end
  end
end
