require 'spec_helper'

feature 'Managing Photo Selections' do

  scenario 'a user can visit the Photo Select page' do
    VCR.use_cassette('features/photo_select/show') do
      visit '/'
      find("a.photo_select_btn").click
      expect(page).to have_content 'Photo Select'
    end
  end
end