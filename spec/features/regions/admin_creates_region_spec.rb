require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do
  scenario "with correct values is succesful" do
    user = create(:user)
    log_in_as(user)
    visit "/regions"
    click_on "Add Region"
    fill_in "Name", with: "Fake Region"
    click_on "Add Region"
    expect(page).to have_text "Region successfully created."
    expect{Region.find_by(name: "Fake Region")}.not_to raise_error
  end

  scenario "with a duplicate name is not successful" do
    user = create(:user)
    region = create(:region)
    log_in_as(user)

    visit "/regions"
    click_on "Add Region"
    fill_in "Name", with: region.name
    click_on "Add Region"
    expect(page).to have_text "error prohibited this region from being saved"
    expect(page).to have_text "Name has already been taken"
  end
end
