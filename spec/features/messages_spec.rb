require 'spec_helper'

feature 'Managing Form for Sending eCard' do
  scenario 'a user can preview and send an eCard (without User Auth)' do
    VCR.use_cassette('features/photo_select/preview_and_send') do
      ActionMailer::Base.deliveries = []
      expect(ActionMailer::Base.deliveries.length).to eq 0
      visit '/'
      find("a.photo_select_btn").click
      find("a.button.green", match: :first).click
      fill_in 'Your name', with: 'Peggy Griffin'
      fill_in 'Your email  (required)', with: 'peggy@example.com'
      fill_in 'Recipient name', with: 'John Doe'
      fill_in 'Recipient email  (required)', with: 'john@example.com'
      fill_in 'Type your message here (required)', with: 'I thought you\'d like this card'
      click_on 'Preview'
      click_on 'Send'
      expect(page).to have_content 'Your eCard has been sent!'
      expect(ActionMailer::Base.deliveries.length).to eq 1

    end
  end

  scenario 'User and recipient emails and message are validated' do
    VCR.use_cassette('features/photo_select/preview_and_send') do
      ActionMailer::Base.deliveries = []
      expect(ActionMailer::Base.deliveries.length).to eq 0
      visit '/'
      find("a.photo_select_btn").click
      find("a.button.green", match: :first).click
      fill_in 'Your name', with: 'Peggy Griffin'
      fill_in 'Your email  (required)', with: 'peggy@@example.com'
      fill_in 'Recipient name', with: 'John Doe'
      fill_in 'Recipient email  (required)', with: 'john.com'
      fill_in 'Type your message here (required)', with: ''
      click_on 'Preview'
      expect(page).to have_content '3 errors prevented this ecard from being saved:'
      expect(page).to have_content 'Message can\'t be blank'
      expect(page).to have_content 'Sender email is invalid'
      expect(page).to have_content 'Recipient email is invalid'
      fill_in 'Your email  (required)', with: 'peggy@example.com'
      fill_in 'Recipient email  (required)', with: 'john@example.com'
      fill_in 'Type your message here (required)', with: 'I thought you\'d like this card'
      click_on 'Preview'
      click_on 'Send'
      expect(page).to have_content 'Your eCard has been sent!'
      expect(ActionMailer::Base.deliveries.length).to eq 1
    end
  end

  scenario 'a user can preview, edit and send an eCard (without User Auth)' do
    VCR.use_cassette('features/photo_select/preview_edit_send') do
      ActionMailer::Base.deliveries = []
      expect(ActionMailer::Base.deliveries.length).to eq 0
      visit '/'
      find("a.photo_select_btn").click
      find("a.button.green", match: :first).click
      fill_in 'Your name', with: 'Peggy'
      fill_in 'Your email  (required)', with: 'peggy@example.com'
      fill_in 'Recipient name', with: 'John Doe'
      fill_in 'Recipient email  (required)', with: 'john@example.com'
      fill_in 'Type your message here (required)', with: 'I thought you\'d like this card'
      click_on 'Preview'
      expect(page).to have_content 'Hi John Doe!You have received an ecard from Peggy at peggy@example.com:'
      click_on 'Edit'
      fill_in 'Your name', with: 'Peggy Sue'
      fill_in 'Your email  (required)', with: 'peggysue@example.com'
      fill_in 'Recipient name', with: 'John Boy'
      fill_in 'Recipient email  (required)', with: 'johnboy@example.com'
      fill_in 'Type your message here (required)', with: 'I really thought you would like this card'
      click_on 'Preview'
      expect(page).to have_content 'Hi John Boy!You have received an ecard from Peggy Sue at peggysue@example.com:'
      click_on 'Send'
      expect(page).to have_content 'Your eCard has been sent!'
      expect(ActionMailer::Base.deliveries.length).to eq 1
    end
  end

  scenario 'a user can preview and send multiple eCards (without User Auth)' do
    VCR.use_cassette('features/photo_select/preview_and_send_two_or_more_cards') do
      ActionMailer::Base.deliveries = []
      expect(ActionMailer::Base.deliveries.length).to eq 0
      visit '/'
      find("a.photo_select_btn").click
      find("a.button.green", match: :first).click
      fill_in 'Your name', with: 'Peggy Griffin'
      fill_in 'Your email  (required)', with: 'peggy@example.com'
      fill_in 'Recipient name', with: 'John Doe'
      fill_in 'Recipient email  (required)', with: 'john@example.com'
      fill_in 'Type your message here (required)', with: 'I thought you\'d like this card'
      click_on 'Preview'
      click_on 'Send'
      expect(page).to have_content 'Your eCard has been sent!'
      find("a.ecards_btn").click
      fill_in 'Your name', with: 'Peggy Griffin'
      fill_in 'Your email  (required)', with: 'peggy@example.com'
      fill_in 'Recipient name', with: 'Fred'
      fill_in 'Recipient email  (required)', with: 'fred@example.com'
      fill_in 'Type your message here (required)', with: 'I wanted you to have this card'
      click_on 'Preview'
      click_on 'Send'
      expect(ActionMailer::Base.deliveries.length).to eq 2
    end
  end

  scenario 'a user can cancel sending of an eCard from multiple pages' do
    VCR.use_cassette('features/photo_select/cancel_ecard_from_multiple_pages') do
      ActionMailer::Base.deliveries = []
      expect(ActionMailer::Base.deliveries.length).to eq 0
      visit '/'
      find("a.photo_select_btn").click

      find("a.button.green", match: :first).click
      click_on 'Cancel'
      expect(page).to have_content 'Your eCard has been cancelled'

      find("a.button.green", match: :first).click
      expect(page).to have_content 'Send eCard'
      fill_in 'Your name', with: 'Peggy'
      fill_in 'Your email  (required)', with: 'peggy@example.com'
      fill_in 'Recipient name', with: 'John Doe'
      fill_in 'Recipient email  (required)', with: 'john@example.com'
      fill_in 'Type your message here (required)', with: 'I thought you\'d like this card'
      click_on 'Preview'
      click_on 'Cancel'
      expect(page).to have_content 'Your eCard has been cancelled'

      find("a.button.green", match: :first).click
      expect(page).to have_content 'Send eCard'
      fill_in 'Your name', with: 'Peggy'
      fill_in 'Your email  (required)', with: 'peggy@example.com'
      fill_in 'Recipient name', with: 'John Doe'
      fill_in 'Recipient email  (required)', with: 'john@example.com'
      fill_in 'Type your message here (required)', with: 'I thought you\'d like this card'
      click_on 'Preview'
      click_on 'Edit'
      click_on 'Cancel'
      expect(page).to have_content 'Your eCard has been cancelled'

      expect(ActionMailer::Base.deliveries.length).to eq 0
    end
  end
end