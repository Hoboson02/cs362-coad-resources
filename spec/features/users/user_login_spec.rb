require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
  scenario "admin user logging in goes to dashboard" do
    user = create(:user)

    visit "/login"
    fill_in "Email address", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign in"
    expect(page).to have_text "Signed in successfully"
    expect(current_path).to eq('/dashboard')
  end
end
