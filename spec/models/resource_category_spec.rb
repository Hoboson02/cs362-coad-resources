require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  let (:resource_category) {build(:resource_category)}
	
  describe "attributes" do
    it "has and belongs to many organizations" do
      expect(resource_category).to have_and_belong_to_many(:organizations)
    end

    it "has many tickets" do
      expect(resource_category).to have_many(:tickets)
    end
  end

  describe "validations" do
    it {should validate_presence_of(:name) }
    it {should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it {should validate_uniqueness_of(:name).case_insensitive }
  end

  describe "::unspecified" do
    it "returns a Resource Category with the name 'Unspecified" do
      resource_category = ResourceCategory.unspecified
      expect(resource_category.name).to eq('Unspecified')
    end
  end

  describe "activate" do
    it "It updates the current category from other to active" do
      resource_category.activate
      expect(resource_category.active).to eq(true)
    end
  end

  describe "deactivate" do
    it "It updates the current category from other to deactived" do
      resource_category.deactivate
      expect(resource_category.active).to eq(false)
    end
  end

  describe "inactive?" do
    it "is inactive when it hasn't been active" do
      resource_category.activate
      expect(resource_category.inactive?).to eq(false)
    end

    it "is not inactive when it has been active" do
      resource_category.deactivate
      expect(resource_category.inactive?).to eq(true)
    end

  end

  describe "to_s" do
    it "returns the name" do
      expect(resource_category.to_s).to eq(resource_category.name)
    end
  end

  describe "#active" do
    it "returns the active resource category in the database if there is only one" do
      active_resource_category = create(:resource_category)
      result = ResourceCategory.active
      expect(result).to include(active_resource_category)
    end

    it "returns all of the active resource categories in the database" do
      active_resource_category_1 = create(:resource_category)
      active_resource_category_2 = create(:resource_category, name: "Other Fake Name")
      result = ResourceCategory.active
      expect(result.length).to eq(2)
      expect(result).to include(active_resource_category_1)
      expect(result).to include(active_resource_category_2)
    end

    it "does not return inactive resource categories in the database" do
      inactive_resource_category = create(:inactive_resource_category)
      result = ResourceCategory.active
      expect(result.length).to eq(0)
    end
  end 
end
