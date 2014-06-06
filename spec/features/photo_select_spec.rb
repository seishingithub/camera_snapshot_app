require 'spec_helper'

feature 'Managing Camera Selections' do

  scenario 'a user can visit the Photo Select page' do
    visit '/'
    click_on 'Photo Select'
    expect(page).to have_content 'Photo Select'
  end
end