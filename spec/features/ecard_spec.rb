require 'spec_helper'

feature 'Managing eCard Sending' do

  scenario 'a user can send an eCard' do
    visit '/'
    click_on 'ECards'
    expect(page).to have_content 'Choose a photo to put on your eCard'
  end
end