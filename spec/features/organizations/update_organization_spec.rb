require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do
  scenario "user is editing their organization" do
    approved_organization = create(:organization, status: :approved)
    user = build(:user, role: :organization, email: "test@test.com", password: "password", organization: approved_organization)
    user.confirm
    log_in_as(user)

    visit "/dashboard"

    click_on "Edit Organization"

    click_on "Update Resource"
  end
end
