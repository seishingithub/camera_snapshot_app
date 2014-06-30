feature 'Managing Form for Sending eCard' do

  scenario 'a user can send an eCard without first previewing the eCard' do
    visit '/'
    click_on 'ECards'
    expect(page).to have_content 'Send eCard'
    # NEED TO CONNECT TO CLICK-ON EVENT TO GET TO THE NEXT PAGE
    fill_in 'Your first name', with: 'Peggy'
    fill_in 'Your last name', with: 'Griffin'
    fill_in 'Your e-mail address', with: 'peggy@example.com' # Required
    fill_in 'Recipient\'s name', with: 'John Doe'
    fill_in 'Recipient\'s e-mail address', with: 'john@example.com' # Required
    fill_in 'Text', with: 'I thought you\'d like this card' # Required
    click_on 'Send'
    expect(page).to have_content 'eCard sent successfully'
  end

  scenario 'a user can preview and edit and send an eCard' do
    visit '/'
    click_on 'ECards'
    expect(page).to have_content 'Send eCard'
    fill_in 'Your first name', with: 'Peggy'
    fill_in 'Your last name', with: 'Griffin'
    fill_in 'Your e-mail address', with: 'peggy@example.com' # Required
    fill_in 'Recipient\'s name', with: 'John Doe'
    fill_in 'Recipient\'s e-mail address', with: 'john@example.com' # Required
    fill_in 'Text', with: 'I thought you\'d like this card' # Required
    click_on 'Preview'
    expect(page).to have_content 'Hi John Doe! Peggy (peggy@example.com) has sent you an eCard:'
    fill_in 'Your first name', with: 'Peggy Sue'
    fill_in 'Your last name', with: 'G.'
    fill_in 'Your e-mail address', with: 'peggysue@example.com' # Required
    fill_in 'Recipient\'s name', with: 'John Boy'
    fill_in 'Recipient\'s e-mail address', with: 'johnboy@example.com' # Required
    fill_in 'Text', with: 'I really thought you would like this card' # Required
    click_on 'Preview'
    expect(page).to have_content 'Hi John Boy! Peggy Sue (peggysue@example.com) has sent you an eCard:'
    click_on 'Send'
    # NEED TO ADD SPEC FOR ACTION MAILER
  end

  scenario 'a user can send multiple eCards (without first previewing the eCard)' do
    visit '/'
    click_on 'ECards'
    expect(page).to have_content 'Send eCard'
    fill_in 'Your first name', with: 'Peggy'
    fill_in 'Your last name', with: 'Griffin'
    fill_in 'Your e-mail address', with: 'peggy@example.com' # Required
    fill_in 'Recipient\'s name', with: 'John Doe'
    fill_in 'Recipient\'s e-mail address', with: 'john@example.com' # Required
    fill_in 'Text', with: 'I thought you\'d like this card' # Required
    click_on 'Send'
    expect(page).to have_content 'eCard sent successfully'
    click_on 'Send another eCard'
    expect(page).to have_content 'Send eCard'
    fill_in 'Your first name', with: 'Peggy'
    fill_in 'Your last name', with: 'Griffin'
    fill_in 'Your e-mail address', with: 'peggy@example.com' # Required
    fill_in 'Recipient\'s name', with: 'Fred'
    fill_in 'Recipient\'s e-mail address', with: 'fred@example.com' # Required
    fill_in 'Text', with: 'I wanted you to have this card' # Required
    click_on 'Send'
    expect(page).to have_content 'eCard sent successfully'
    click_on 'Send another eCard'
  end

  scenario 'a user can cancel sending of an eCard' do
    visit '/'
    click_on 'ECards'
    expect(page).to have_content 'Send eCard'
    click_on 'Cancel'
    expect(page).to have_content 'Photo Select' #BACK TO PHOTOSELECT INDEX
  end
end