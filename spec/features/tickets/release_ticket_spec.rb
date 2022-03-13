require 'rails_helper'

RSpec.describe 'Releasing a ticket by an', type: :feature do
  scenario "admin user is successful" do
    user = create(:user)
    ticket = create(:ticket)
    organization = create(:organization)

    ticket.organization = organization
    ticket.save

    expect(ticket).to be_captured

    log_in_as(user)
    visit("/tickets/#{ticket.id}")
    click_on 'Release'
    
    ticket.reload
    expect(ticket).to_not be_captured
  end
end
