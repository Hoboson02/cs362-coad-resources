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

  scenario "organization user logging in goes to dashboard" do
    user = create(:organization_user)

    visit '/login'
    fill_in 'Email address', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'
    expect(page).to have_text 'Signed in successfully'
    expect(current_path).to eq('/dashboard')
  end

  scenario "with incorrect credentials causes an error to display" do
    visit '/login'
    fill_in 'Email address', with: "wrongemail@bad.com"
    fill_in 'Password', with: "wrongpassword"
    click_on 'Sign in'
    expect(page).to have_text 'Invalid Email or password.'
  end 
end
