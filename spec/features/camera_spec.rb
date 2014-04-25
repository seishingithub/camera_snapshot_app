require 'spec_helper'

feature "Managing Cameras" do
  scenario "User visits Camera homepage" do
    visit '/'

    expect(page).to have_content "Welcome"

    #visit('/about')
    #expect(page).to have_content "About 'The Camera Snapshot'"
    #
    #visit('/best_cameras')
    #expect(page).to have_content "Best Cameras to Buy"
    #
    #visit('/reviews')
    #expect(page).to have_content "Camera Reviews"
    #
    #visit('/forum')
    #expect(page).to have_content "Readers Forum"
    #
    #visit('/photo_contest')
    #expect(page).to have_content "Photo Contest"
  end
end
