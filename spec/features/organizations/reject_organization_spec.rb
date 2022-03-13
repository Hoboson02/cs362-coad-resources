require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do
  let(:admin) { create(:user, role: :admin, email: "admin_test@test.com", password: "password") }
  scenario "as an administrative user viewing applications" do
    admin.confirm
    create(:organization)
    log_in_as(admin)
    visit "/organizations"
    click_on "Pending"
    click_on "Review"
    expect(page).to have_content("I own and am responsible")
    click_on "Reject"
    expect(page).to have_content("has been rejected")
  end
end