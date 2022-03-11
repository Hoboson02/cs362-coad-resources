require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
  scenario "is successful when user is an admin" do
    user = create(:user)
    ticket = create(:ticket)
    log_in_as(user)
    
    visit "/tickets/#{ticket.id}"
    click_on "Delete"
    expect(page).to have_text "Ticket #{ticket.id} was deleted."
    expect{ Ticket.find(ticket.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
