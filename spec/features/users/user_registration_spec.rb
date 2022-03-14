require 'rails_helper'

RSpec.describe 'User registration', type: :feature do
  scenario "as a potential new user" do
    visit "/signup"
    fill_in 'user_email', with: "testing@test.com"
    fill_in 'user_password', with: "passw0rd"
    fill_in 'user_password_confirmation', with: "passw0rd"
    click_on "commit"

    expect(page).to have_text "Please follow the link to activate your account"
  end

end
