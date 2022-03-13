require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do
  let(:admin) { create(:user, role: :admin, email: "admin_test@test.com", password: "password") }
  scenario "as an administrative user viewing regions" do
    create(:region)
    log_in_as(admin)
    visit "/regions"
    visit "/regions/1"
    click_on "Delete"
    expect(page).to have_text "Associated tickets"
  end
end
