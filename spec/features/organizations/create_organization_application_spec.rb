require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do
  scenario "user is applying" do
    skip
    user = create(:user)
    user.email = "test@test.com"
    user.password = "password"
    user.organization = nil
    user.role = nil
    user.confirm
    user.save!
    log_in_as(user)


    visit "/new_organization_application"
  
    choose "organization[]"  
    choose "organization[]"  
    choose "organization[]"
    choose "organization[]"
    choose "organization[]"
    choose "organization[]"
    choose "organization[]"
    choose "organization[]"  
    choose "organization[]"
    fill_in "organization"
    fill_in "organization"
    fill_in "organization"
    fill_in "organization"
    fill_in "organization"
    fill_in "organization"
    fill_in "organization"
    fill_in "organization"  

    click_on "Apply"

    expect(page).to have_text("Thank you for applying.")
  end
end
