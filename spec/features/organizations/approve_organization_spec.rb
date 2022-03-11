require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do
  scenario 'approves a pending organization' do
    user = create(:user)
    organization = create(:organization)
    
    expect(organization).to_not be_approved
    
    log_in_as(user)
    visit "/organizations/#{organization.id}"
    click_on 'Approve'
    expect(page).to have_text "Organization #{organization.name} has been approved."

    organization.reload
    expect(organization).to be_approved
  end
end
