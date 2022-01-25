require 'rails_helper'

RSpec.describe Organization, type: :model do

    describe "attributes" do
        it "has six agreements labeled agreement_{number}" do
            organization = Organization.new
            expect(organization).to respond_to(:agreement_one)
            expect(organization).to respond_to(:agreement_two)
            expect(organization).to respond_to(:agreement_three)
            expect(organization).to respond_to(:agreement_four)
            expect(organization).to respond_to(:agreement_five)
            expect(organization).to respond_to(:agreement_six)
        end

        it "has a status" do
            organization = Organization.new
            expect(organization).to respond_to(:status)
        end

        it "has a status of submitted after initialization" do
            organization = Organization.new
            expect(organization.status).to eq("submitted")
        end

        it "has a transportation enum" do
            organization = Organization.new
            expect(organization).to respond_to(:transportation)
        end

        it "has users" do
            organization = Organization.new
            expect(organization).to respond_to(:users)
        end

        it "has tickets" do
            organization = Organization.new
            expect(organization).to respond_to(:tickets)
        end

        it "has resource categories" do
            organization = Organization.new
            expect(organization).to respond_to(:resource_categories)
        end

        it "has an email" do
            organization = Organization.new
            expect(organization).to respond_to(:email)
        end

        it "has a name" do
            organization = Organization.new
            expect(organization).to respond_to(:name)
        end

        it "has a phone" do
            organization = Organization.new
            expect(organization).to respond_to(:phone)
        end

        it "has a status" do
            organization = Organization.new
            expect(organization).to respond_to(:status)
        end

        it "has a primary name" do
            organization = Organization.new
            expect(organization).to respond_to(:primary_name)
        end

        it "has a secondary name" do
            organization = Organization.new
            expect(organization).to respond_to(:secondary_name)
        end

        it "has a secondary phone" do
            organization = Organization.new
            expect(organization).to respond_to(:secondary_phone)
        end
    end

    describe "validations" do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:email) }
        it { should validate_presence_of(:phone) }
        it { should validate_presence_of(:status) }
        it { should validate_presence_of(:primary_name) }
        it { should validate_presence_of(:secondary_name) }
        it { should validate_presence_of(:secondary_phone) }

        it { should validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create) }

        it "only allows valid email addresses and not invalid ones" do
            should allow_value("fakeemail@fake.com").for(:email)
            should_not allow_value("fakeemail@fake").for(:email)
            should_not allow_value("fakeemail@.com").for(:email)
            should_not allow_value("fakeemailfake.com").for(:email)
            should_not allow_value("@fake.com").for(:email)
            should_not allow_value("").for(:email)
        end
        
        it { should validate_uniqueness_of(:email).case_insensitive }

        it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
        it { should validate_uniqueness_of(:name).case_insensitive }
        it { should validate_length_of(:description).is_at_most(1020).on(:create) }
    end

    describe "associations" do
        it { should have_many(:users) }
        it { should have_many(:tickets) }
        it { should have_and_belong_to_many(:resource_categories) }
    end

    describe "#approve" do
        it "changes status to approved from other status" do
            organization = Organization.new
            expect(organization.status).to_not eq("approved")
            organization.approve
            expect(organization.status).to eq("approved")
        end
    end

    describe "#reject" do
        it "changes status to rejected from other status" do
            organization = Organization.new
            expect(organization.status).to_not eq("rejected")
            organization.reject
            expect(organization.status).to eq("rejected")
        end
    end

    describe "#set_default_status" do
        it "sets the status to submitted from nil" do
            organization = Organization.new
            organization.status = nil
            expect(organization.status).to_not eq("submitted")
            organization.set_default_status
            expect(organization.status).to eq("submitted")
        end

        it "won't change status if it is not nill" do
            organization = Organization.new
            organization.status = "approved"
            organization.set_default_status
            expect(organization.status).to eq("approved")
        end
    end

    describe "#to_so" do
        it "returns the name" do
            organization = Organization.new
            organization.name = "Fake Name"
            expect(organization.to_s).to eq("Fake Name")
        end
    end
end
