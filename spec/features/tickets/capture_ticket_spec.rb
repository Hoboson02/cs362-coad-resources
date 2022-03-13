require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
  scenario "as a user viewing tickets" do
    approved_organization = create(:organization, status: :approved)
    tickets = create(:ticket)
    user = build(:user, role: :organization, email: "test@test.com", password: "password", organization: approved_organization)
    user.confirm
    log_in_as(user)

    visit "/dashboard"
 
    click_on "Tickets"

    find(:xpath, "//a[@href='/tickets/1']").click

    click_on "Capture"

  end
end
