require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do
  scenario "as a signed in organization user who has already captured the ticket" do
    approved_organization = create(:organization, status: :approved)
    tickets = create(:ticket)
    user = build(:user, role: :organization, email: "test@test.com", password: "password", organization: approved_organization)
    user.confirm
    log_in_as(user)

    visit "/dashboard"
 
    click_on "Tickets"

    find(:xpath, "//a[@href='/tickets/1']").click
    click_on "Capture"

    find(:xpath, "//a[@href='/tickets/1']").click
    click_on "Close"

    find(:xpath, "//a[@href='/tickets/1']").click
    expect(page).to have_text("Closed")
    
  end
end
