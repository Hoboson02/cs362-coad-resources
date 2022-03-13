require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do
  scenario "organization user is looking to get help" do
    approved_organization = create(:organization, status: :approved)
    region = create(:region)
    resource_category = create(:resource_category)
    user = build(:user, role: :organization, email: "test@test.com", password: "password", organization: approved_organization)
    user.confirm
    log_in_as(user)

    visit "/tickets/new"

    fill_in "ticket_name", with: "John Doe"
    fill_in "ticket_phone", with: "5555555555"
    select "John Doe", from: "ticket_region_id"
    select "Fake Resource Category", from: "ticket_resource_category_id"
    fill_in "ticket_description", with: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    click_on "Send this help request"
    expect(page).to have_text "Thank you for submitting"
  end
end
