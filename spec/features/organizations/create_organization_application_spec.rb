require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do
  scenario "user is applying" do
    # skip
    expect_any_instance_of(UserMailer).to receive(:new_organization_application)
    user = build(:user, role: :organization, email: "test@test.com", password: "password")
    user.confirm
    log_in_as(user)

    visit "/new_organization_application"
  
    # choose "organization_liability_yes"
    choose("organization_agreement_one_true")  
    choose("organization_agreement_two_true")
    choose("organization_agreement_three_true")
    choose("organization_agreement_four_true")
    choose("organization_agreement_five_true")
    choose("organization_agreement_six_true")
    choose("organization_agreement_seven_true")
    choose("organization_agreement_eight_true")  
    fill_in("organization_primary_name", with: "Montoya, Inigo")
    fill_in("organization_name", with: "My name is Industries")
    fill_in("organization_title", with:"Fake title")
    fill_in("organization_phone", with:"111-111-1111")
    fill_in("organization_secondary_name", with:"business person")
    fill_in("organization_secondary_phone", with:"222-222-2222")
    fill_in("organization_email", with:"business.email@email.com")
    fill_in("organization_description", with:"Items of donation")
    choose("organization_transportation_maybe")

    click_on "Apply"

    expect(page).to have_text("Application Submitted")
  end
end
