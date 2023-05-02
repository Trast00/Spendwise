require 'application_system_test_case'

class CategoriesTest < ApplicationSystemTestCase
  setup do
    @category = categories(:one)
  end

  test 'visiting the index' do
    visit categories_url
    assert_selector 'h1', text: 'Categories'
  end

  test 'should create categorie' do
    visit categories_url
    click_on 'New categorie'

    fill_in 'Icon', with: @category.icon
    fill_in 'Name', with: @category.name
    fill_in 'User', with: @category.user_id
    click_on 'Create Categorie'

    assert_text 'Categorie was successfully created'
    click_on 'Back'
  end

  test 'should update Categorie' do
    visit category_url(@category)
    click_on 'Edit this categorie', match: :first

    fill_in 'Icon', with: @category.icon
    fill_in 'Name', with: @category.name
    fill_in 'User', with: @category.user_id
    click_on 'Update Categorie'

    assert_text 'Categorie was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Categorie' do
    visit category_url(@category)
    click_on 'Destroy this categorie', match: :first

    assert_text 'Categorie was successfully destroyed'
  end
end
