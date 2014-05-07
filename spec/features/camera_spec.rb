require 'spec_helper'

feature "Managing Cameras" do
  scenario "a user can create a camera, see it on the list, and delete it" do
    visit '/'
    click_on 'Reviews'
    click_on 'Add New Camera'
    visit '/cameras/new' # GET new

    fill_in 'Name', with: 'Canon G9'
    fill_in 'Description', with: 'This is a Canon camera'

    click_on 'Create Camera' # POST create

    # redirect GET show
    expect(page).to have_content 'Canon G9'
    expect(page).to have_content 'This is a Canon camera'

    visit '/cameras' # GET index
    expect(page).to have_content 'Canon G9'

    click_on 'Canon G9' # GET show

    expect(page).to have_content 'Canon G9'
    expect(page).to have_content 'This is a Canon camera'

    click_on 'Edit' # EDIT
    fill_in 'Name', with: 'Fuji FinePix'
    fill_in 'Description', with: 'This is a Fuji camera'
    click_on 'Update Camera'

    expect(page).to have_no_content('Canon G9')
    expect(page).to have_no_content('This is a Canon camera')

    expect(page).to have_content('Fuji FinePix')
    expect(page).to have_content('This is a Fuji camera')

    click_on 'Delete' # DELETE destroy

    visit '/cameras' # GET index

    expect(page).to_not have_content 'Canon G9'
  end
end
