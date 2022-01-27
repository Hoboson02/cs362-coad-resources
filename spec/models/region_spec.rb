require 'rails_helper'

RSpec.describe Region, type: :model do
  it "exists" do 
    Region.new
  end

  describe "#to_s" do 
    it "returns the name" do
      name = 'My Hood'
      region = Region.new(name: name)
      expect(region.to_s).to eq(name)
    end
  end

  describe "::unspecified" do 
    it "returns a Region with the name 'Unspecified" do
      region = Region.unspecified
      expect(region.name).to eq('Unspecified')
    end
  end

end
