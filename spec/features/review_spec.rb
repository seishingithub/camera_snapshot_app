require 'spec_helper'

feature 'Managing Camera Reviews' do

  before do
    visit '/'
    click_on 'Reviews'
    click_on 'Add New Review'
    fill_in 'Make', with: 'Canon'
    fill_in 'Model', with: 'G9'
    fill_in 'Camera Review', with: 'The G9 is an incredibly versatile camera.'
    fill_in 'Conclusion', with: 'Great for anyone shooting in tough and adverse conditions.'
    attach_file('Sample Photo', 'spec/fixtures/images/dog_thru_fence.jpg')
    click_on 'Save Review'
  end

  scenario 'a user can visit the index' do
    visit '/'
    expect(page).to have_content 'Reviews'
  end

  scenario 'a user can create a camera review' do
    expect(page).to have_content 'Canon'
    expect(page).to have_content 'G9'
    expect(page).to have_content 'The G9 is an incredibly versatile camera.'
    expect(page).to have_content 'Great for anyone shooting in tough and adverse conditions.'
  end

  scenario 'a user can view a single camera review' do
    click_on 'G9'
    expect(page).to have_content 'Canon'
    expect(page).to have_content 'G9'
    expect(page).to have_content 'The G9 is an incredibly versatile camera.'
    expect(page).to have_content 'Great for anyone shooting in tough and adverse conditions.'
  end

  scenario 'a user can edit a camera review' do
    visit '/reviews'
    click_on 'G9'
    expect(page).to have_content 'Canon'
    expect(page).to have_content 'G9'
    expect(page).to have_content 'The G9 is an incredibly versatile camera.'
    expect(page).to have_content 'Great for anyone shooting in tough and adverse conditions.'
    click_on 'Edit This Review'
    fill_in 'review[make]', with: 'Fuji'
    fill_in 'review[model]', with: 'FinePix S1'
    fill_in 'review[camera_review]', with: 'Fuji continues to excel at what they can do with their compact point-n-shoot reviews.'
    fill_in 'review[conclusion]', with: 'The versatility is what gives the Fuji FinePix S1 a reason to be on your radar.'
    attach_file('Sample Photo', 'spec/fixtures/images/dog_thru_fence.jpg')
    click_on 'Update Review'
    expect(page).to have_content 'Fuji'
    expect(page).to have_content 'FinePix S1'
    expect(page).to have_content 'Fuji continues to excel at what they can do with their compact point-n-shoot reviews.'
    expect(page).to have_content 'The versatility is what gives the Fuji FinePix S1 a reason to be on your radar.'
  end

  scenario 'a user can delete a camera review' do
    visit '/reviews'
    click_on 'G9'
    click_on 'Delete This Review'
    expect(page).to have_no_content 'Canon'
    expect(page).to have_no_content 'G9'
    expect(page).to have_no_content 'The G9 is an incredibly versatile camera.'
    expect(page).to have_no_content 'Great for anyone shooting in tough and adverse conditions.'
  end

  scenario 'user cannot enter blank fields when creating a camera review' do
    pending
    visit '/reviews'
    click_on 'Add New Review'
    click_on 'Save Review'
    expect(page).to have_content 'Make can\'t be blank'
    expect(page).to have_content 'Model can\'t be blank'
    expect(page).to have_content 'Camera Review can\'t be blank'
    expect(page).to have_content 'Conclusion can\'t be blank'
  end
end