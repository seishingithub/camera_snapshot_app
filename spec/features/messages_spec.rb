require 'spec_helper'

feature 'Managing Form for Sending eCard' do
#NEED TO ADD SPEC TO MAKE SURE PHOTO IS INCLUDED...?
  scenario 'a user can send an eCard without first previewing the eCard (without User Auth)' do
    visit '/'
    click_on 'ECards'
    expect(page).to have_content 'Send eCard'
    # NEED TO CONNECT TO CLICK-ON EVENT TO GET TO THE NEXT PAGE
    fill_in 'Your name', with: 'Peggy Griffin'
    fill_in 'Your email  (required)', with: 'peggy@example.com' # Required
    fill_in 'Recipient name', with: 'John Doe'
    fill_in 'Recipient email  (required)', with: 'john@example.com' # Required
    fill_in 'Type your message here (required)', with: 'I thought you\'d like this card' # Required
    click_on 'Send'
    expect(page).to have_content 'eCard sent successfully'
  end

  scenario 'a user can preview, edit and send an eCard (without User Auth)' do
    ActionMailer::Base.deliveries = []
    expect(ActionMailer::Base.deliveries.length).to eq 0
    visit '/'
    click_on 'ECards'
    expect(page).to have_content 'Send eCard'
    fill_in 'Your name', with: 'Peggy'
    fill_in 'Your email  (required)', with: 'peggy@example.com' # Required
    fill_in 'Recipient name', with: 'John Doe'
    fill_in 'Recipient email  (required)', with: 'john@example.com' # Required
    fill_in 'Type your message here (required)', with: 'I thought you\'d like this card' # Required
    click_on 'Preview'
    expect(page).to have_content 'Hi John Doe! Peggy (peggy@example.com) has sent you an eCard:'
    expect(page).to have_content 'I thought you\'d like this card'
    click_on 'Edit'
    # MAYBE DELETE BELOW
    fill_in 'Your name', with: 'Peggy Sue'
    fill_in 'Your email  (required)', with: 'peggysue@example.com' # Required
    fill_in 'Recipient name', with: 'John Boy'
    fill_in 'Recipient email  (required)', with: 'johnboy@example.com' # Required
    fill_in 'Type your message here (required)', with: 'I really thought you would like this card' # Required
    click_on 'Preview' # Presently, this is link reloading messages/new. Need to redirect & retain fields
    expect(page).to have_content 'Hi John Boy! Peggy Sue (peggysue@example.com) has sent you an eCard:'
    # MAYBE DELETE ABOVE
    # VCR.use_cassette('features/photo_select/show') do
    #   click_on 'Send'
    # expect(ActionMailer::Base.deliveries.length).to eq 1
    # expect(page).to have_content 'Your message has been sent!'
  end
  # NEED TO ADD SPEC FOR ACTION MAILER
  #end
  #
  #  scenario 'a user can send multiple eCards (without first previewing the eCard and without User Auth)' do
  #    visit '/'
  #    click_on 'ECards'
  #    expect(page).to have_content 'Send eCard'
  #    fill_in 'Your name', with: 'Peggy Griffin'
  #    fill_in 'Your email  (required)', with: 'peggy@example.com' # Required
  #    fill_in 'Recipient name', with: 'John Doe'
  #    fill_in 'Recipient email  (required)', with: 'john@example.com' # Required
  #    fill_in 'Type your message here (required)', with: 'I thought you\'d like this card' # Required
  #    click_on 'Send'
  #    expect(page).to have_content 'eCard sent successfully'
  #    click_on 'Send another eCard'
  #    expect(page).to have_content 'Send eCard'
  #    fill_in 'Your name', with: 'Peggy Griffin'
  #    fill_in 'Your email  (required)', with: 'peggy@example.com' # Required
  #    fill_in 'Recipient name', with: 'Fred'
  #    fill_in 'Recipient email  (required)', with: 'fred@example.com' # Required
  #    fill_in 'Type your message here (required)', with: 'I wanted you to have this card' # Required
  #    click_on 'Send'
  #    expect(page).to have_content 'eCard sent successfully'
  #    click_on 'Send another eCard'
  #  end
  #

  scenario 'a user can cancel sending of an eCard' do
    visit '/'
    click_on 'ECards'
    expect(page).to have_content 'Send eCard'
    fill_in 'Your name', with: 'Peggy'
    fill_in 'Your email  (required)', with: 'peggy@example.com' # Required
    fill_in 'Recipient name', with: 'John Doe'
    fill_in 'Recipient email  (required)', with: 'john@example.com' # Required
    fill_in 'Type your message here (required)', with: 'I thought you\'d like this card' # Required
    click_on 'Preview'
    expect(page).to have_content 'Hi John Doe! Peggy (peggy@example.com) has sent you an eCard:'
    expect(page).to have_content 'I thought you\'d like this card'
    click_on 'Cancel'
    # MAYBE DELETE BELOW
    expect(page).to have_content 'Photo Select' #BACK TO PHOTOSELECT INDEX
    expect(ActionMailer::Base.deliveries.length).to eq 0
    # MAYBE DELETE ABOVE
    # expect(page).to have_content 'Your message has been cancelled'
  end
end
