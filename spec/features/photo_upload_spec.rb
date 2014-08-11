require 'spec_helper'

feature 'Upload Photos' do
  scenario 'User can upload photos' do
    VCR.use_cassette('features/photo_upload/aws_uploading_images') do
      visit '/'
      find("a.photo_select_btn").click
      expect(page).to have_content 'Upload Image'
      attach_file "photo_upload[name]", "./spec/support/test_image.jpg"
      click_on 'Upload Now'
      expect(page).to have_css("img[src*='amazonaws']")
    end
  end
end