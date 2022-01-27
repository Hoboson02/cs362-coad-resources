require 'rails_helper'

RSpec.describe Ticket, type: :model do
    it "exists" do
        Ticket.new
    end

    describe "attributes" do
        it "has a region" do
            ticket = Ticket.new
            expect(ticket).to respond_to(:region)
        end

        it "has a resource category" do
            ticket = Ticket.new
            expect(ticket).to respond_to(:resource_category)
        end

        it "has an organization" do
            ticket = Ticket.new
            expect(ticket).to respond_to(:organization)
        end

        it "has a name" do
            ticket = Ticket.new
            expect(ticket).to respond_to(:name)
        end

        it "has a phone" do
            ticket = Ticket.new
            expect(ticket).to respond_to(:phone)
        end

        it "has a description" do
            ticket = Ticket.new
            expect(ticket).to respond_to(:description)
        end

        it "has a closed" do
            ticket = Ticket.new
            expect(ticket).to respond_to(:closed)
        end

        it "has a closed_at" do
            ticket = Ticket.new
            expect(ticket).to respond_to(:closed_at)
        end     
    end

    describe "#open?" do
        it "is open when it hasn't been closed" do
            ticket = Ticket.new(closed: false)
            expect(ticket.closed).to eq(false)
            expect(ticket.open?).to eq(true)
        end

        it "is not open when it has been closed" do
            ticket = Ticket.new(closed: true)
            expect(ticket.closed).to eq(true)
            expect(ticket.open?).to eq(false)
        end
    end
end
