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
