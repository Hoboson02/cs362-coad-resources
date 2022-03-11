require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do
  it "approves an organization" do
    user = create(:user)
    organization = create(:organization)
    log_in_as(user)
    visit "/organizations/#{organization.id}"
    click_on "Approve"
    expect(page).to have_text "Organization #{organization.name} has been approved."
  end
end
