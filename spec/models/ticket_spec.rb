require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { build(:ticket) }
  let(:closed_ticket) { build(:closed_ticket) }

  describe "attributes" do
    it "has a region" do
      expect(ticket).to respond_to(:region)
    end

    it "has a resource category" do
      expect(ticket).to respond_to(:resource_category)
    end

    it "has an organization" do
      expect(ticket).to respond_to(:organization)
    end

    it "has a name" do
      expect(ticket).to respond_to(:name)
    end

    it "has a phone" do
      expect(ticket).to respond_to(:phone)
    end

    it "has a description" do
      expect(ticket).to respond_to(:description)
    end

    it "has a closed" do
      expect(ticket).to respond_to(:closed)
    end

    it "has a closed_at" do
      expect(ticket).to respond_to(:closed_at)
    end     
  end

  describe "associations" do
    it { should belong_to(:region) }
    it { should belong_to(:resource_category) }
    it { should belong_to(:organization) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:region_id) }
    it { should validate_presence_of(:resource_category_id) }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { should validate_length_of(:description).is_at_most(1020).on(:create) }
    it "validates phone using phony_plausible" do
      expect(Ticket.validators_on(:phone)).to include(PhonyPlausibleValidator)
    end
  end

  describe "#open?" do
    it "is open when it hasn't been closed" do
      expect(ticket.closed).to eq(false)
      expect(ticket.open?).to eq(true)
    end

    it "is not open when it has been closed" do
      expect(closed_ticket.closed).to eq(true)
      expect(closed_ticket.open?).to eq(false)
    end
  end

  describe "#captured?" do
    it "is not captured when an organization is not present" do
      expect(ticket.organization.present?).to eq(false)
      expect(ticket.captured?).to eq(false)
    end

    it "is captured when an organization is present" do
      expect(ticket.captured?).to eq(false)
      ticket.organization = Organization.new
      expect(ticket.captured?).to eq(true)
    end
  end

  describe "#to_s" do
    it "returns a string identifying the ticket number" do
      expected_result = "Ticket -1"
      ticket.id = -1
      expect(ticket.to_s).to eq(expected_result)
    end
  end
end
