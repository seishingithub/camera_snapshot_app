require 'spec_helper'

feature 'Managing Photo Selections' do

  scenario 'a user can visit the Photo Select page' do
    VCR.use_cassette('features/photo_select/show') do
      visit '/'
      click_on 'Photo Select'
      expect(page).to have_content 'Photo Select'
    end
  end
end