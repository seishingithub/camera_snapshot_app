require 'spec_helper'

feature 'Managing Form for Sending eCard' do
#NEED TO ADD SPEC TO MAKE SURE PHOTO IS INCLUDED...?
  scenario 'a user can send an eCard without first previewing the eCard (without User Auth)' do
    ActionMailer::Base.deliveries = []
    expect(ActionMailer::Base.deliveries.length).to eq 0
    visit '/'
    click_on 'ECards'
    expect(page).to have_content 'Send eCard'
    fill_in 'Your name', with: 'Peggy Griffin'
    fill_in 'Your email  (required)', with: 'peggy@example.com' # NEED TO ADD VALIDATION
    fill_in 'Recipient name', with: 'John Doe'
    fill_in 'Recipient email  (required)', with: 'john@example.com' # NEED TO ADD VALIDATION
    fill_in 'Type your message here (required)', with: 'I thought you\'d like this card' # NEED TO ADD VALIDATION
    click_on 'Send'
    VCR.use_cassette('features/photo_select/show') do
      click_on 'Send'
      expect(ActionMailer::Base.deliveries.length).to eq 1
    end
    # expect(page).to have_content 'Your message has been sent!' # NEED TO ADD FLASH MESSAGE
  end

  scenario 'a user can preview and send an eCard (without User Auth)' do
    ActionMailer::Base.deliveries = []
    expect(ActionMailer::Base.deliveries.length).to eq 0
    visit '/'
    click_on 'ECards'
    expect(page).to have_content 'Send eCard'
    fill_in 'Your name', with: 'Peggy'
    fill_in 'Your email  (required)', with: 'peggy@example.com' # NEED TO ADD VALIDATION
    fill_in 'Recipient name', with: 'John Doe'
    fill_in 'Recipient email  (required)', with: 'john@example.com' # NEED TO ADD VALIDATION
    fill_in 'Type your message here (required)', with: 'I thought you\'d like this card' # NEED TO ADD VALIDATION
    click_on 'Preview'
    expect(page).to have_content 'Hi John Doe!You have received an ecard from Peggy at peggy@example.com:'
    # VCR.use_cassette('features/photo_select/show') do
    #   click_on 'Send'
    #   expect(ActionMailer::Base.deliveries.length).to eq 1
    #   expect(page).to have_content 'Your message has been sent!' # NEED TO ADD FLASH MESSAGE
    # end
  end

  scenario 'a user can preview, edit and send an eCard (without User Auth)' do
    ActionMailer::Base.deliveries = []
    expect(ActionMailer::Base.deliveries.length).to eq 0
    visit '/'
    click_on 'ECards'
    expect(page).to have_content 'Send eCard'
    fill_in 'Your name', with: 'Peggy'
    fill_in 'Your email  (required)', with: 'peggy@example.com' # NEED TO ADD VALIDATION
    fill_in 'Recipient name', with: 'John Doe'
    fill_in 'Recipient email  (required)', with: 'john@example.com' # NEED TO ADD VALIDATION
    fill_in 'Type your message here (required)', with: 'I thought you\'d like this card' # NEED TO ADD VALIDATION
    click_on 'Preview'
    expect(page).to have_content 'Hi John Doe!You have received an ecard from Peggy at peggy@example.com:'
    click_on 'Edit'
    fill_in 'Your name', with: 'Peggy Sue'
    fill_in 'Your email  (required)', with: 'peggysue@example.com' # NEED TO ADD VALIDATION
    fill_in 'Recipient name', with: 'John Boy'
    fill_in 'Recipient email  (required)', with: 'johnboy@example.com' # NEED TO ADD VALIDATION
    fill_in 'Type your message here (required)', with: 'I really thought you would like this card' # NEED TO ADD VALIDATION
    click_on 'Preview' # Presently, this is link reloading messages/new. Need to redirect & retain fields
    # expect(page).to have_content 'Hi John Boy! Peggy Sue (peggysue@example.com) has sent you an eCard:'
    # VCR.use_cassette('features/photo_select/show') do
    #   click_on 'Send'
    # expect(ActionMailer::Base.deliveries.length).to eq 1
    # expect(page).to have_content 'Your message has been sent!' # NEED TO ADD FLASH MESSAGE
  end
  # NEED TO ADD SPEC FOR ACTION MAILER

  scenario 'a user can send multiple eCards (without first previewing the eCard and without User Auth)' do
    visit '/'
    click_on 'ECards'
    expect(page).to have_content 'Send eCard'
    fill_in 'Your name', with: 'Peggy Griffin'
    fill_in 'Your email  (required)', with: 'peggy@example.com' # NEED TO ADD VALIDATION
    fill_in 'Recipient name', with: 'John Doe'
    fill_in 'Recipient email  (required)', with: 'john@example.com' # NEED TO ADD VALIDATION
    fill_in 'Type your message here (required)', with: 'I thought you\'d like this card' # NEED TO ADD VALIDATION
    click_on 'Send'
    # expect(page).to have_content 'Your message has been sent!' # NEED TO ADD FLASH MESSAGE
    # click_on 'Send another eCard'
    # expect(page).to have_content 'Send eCard'
    # fill_in 'Your name', with: 'Peggy Griffin'
    # fill_in 'Your email  (required)', with: 'peggy@example.com' # NEED TO ADD VALIDATION
    # fill_in 'Recipient name', with: 'Fred'
    # fill_in 'Recipient email  (required)', with: 'fred@example.com' # NEED TO ADD VALIDATION
    # fill_in 'Type your message here (required)', with: 'I wanted you to have this card' # Required
    # click_on 'Send'
    # expect(page).to have_content 'Your message has been sent!' # NEED TO ADD FLASH MESSAGE
    # click_on 'Send another eCard'
  end

  scenario 'a user can cancel sending of an eCard' do
    ActionMailer::Base.deliveries = []
    expect(ActionMailer::Base.deliveries.length).to eq 0
    visit '/'
    click_on 'ECards'
    expect(page).to have_content 'Send eCard'
    fill_in 'Your name', with: 'Peggy'
    fill_in 'Your email  (required)', with: 'peggy@example.com' # NEED TO ADD VALIDATION
    fill_in 'Recipient name', with: 'John Doe'
    fill_in 'Recipient email  (required)', with: 'john@example.com' # NEED TO ADD VALIDATION
    fill_in 'Type your message here (required)', with: 'I thought you\'d like this card' # NEED TO ADD VALIDATION
    click_on 'Preview'
    expect(page).to have_content 'Hi John Doe!You have received an ecard from Peggy at peggy@example.com:'
    expect(page).to have_content 'I thought you\'d like this card'
    click_on 'Cancel'
    expect(page).to have_content 'Photo Select'
    expect(ActionMailer::Base.deliveries.length).to eq 0
    #expect(page).to have_content 'Your eCard has been cancelled' # NEED TO ADD FLASH MESSAGE
  end
end
