require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:region) { build(:region) }

  describe "#to_s" do 
    it "returns the name" do
      expect(region.to_s).to eq(region.name)
    end
  end

  describe "::unspecified" do 
    it "returns a Region with the name 'Unspecified" do
      region = Region.unspecified
      expect(region.name).to eq('Unspecified')
    end
  end

  describe "validations" do
    it { should validate_presence_of(:name)}
    it { should validate_length_of(:name)}
    it { should validate_uniqueness_of(:name).case_insensitive }
  end
end
