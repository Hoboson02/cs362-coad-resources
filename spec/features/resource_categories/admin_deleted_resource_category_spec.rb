require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
  scenario "is successful" do
    user = create(:user)
    resource_category = create(:resource_category)
    log_in_as(user)

    expect(ResourceCategory.find(resource_category.id)).to eq(resource_category)
    
    visit("/resource_categories/#{resource_category.id}")
    click_on "Delete"
    expect(page).to have_text "Category #{resource_category.name} was deleted"

    expect{ResourceCategory.find(resource_category.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
