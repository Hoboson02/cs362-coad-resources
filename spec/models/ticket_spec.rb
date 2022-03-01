require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { build(:ticket) }
  let(:closed_ticket) { build(:closed_ticket) }

  describe 'attributes' do
    it 'has a region' do
      expect(ticket).to respond_to(:region)
    end

    it 'has a resource category' do
      expect(ticket).to respond_to(:resource_category)
    end

    it 'has an organization' do
      expect(ticket).to respond_to(:organization)
    end

    it 'has a name' do
      expect(ticket).to respond_to(:name)
    end

    it 'has a phone' do
      expect(ticket).to respond_to(:phone)
    end

    it 'has a description' do
      expect(ticket).to respond_to(:description)
    end

    it 'has a closed' do
      expect(ticket).to respond_to(:closed)
    end

    it 'has a closed_at' do
      expect(ticket).to respond_to(:closed_at)
    end
  end

  describe 'associations' do
    it { should belong_to(:region) }
    it { should belong_to(:resource_category) }
    it { should belong_to(:organization) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:region_id) }
    it { should validate_presence_of(:resource_category_id) }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { should validate_length_of(:description).is_at_most(1020).on(:create) }
    it 'validates phone using phony_plausible' do
      expect(Ticket.validators_on(:phone)).to include(PhonyPlausibleValidator)
    end
  end

  describe '#open?' do
    it 'is open when it hasn\'t been closed' do
      expect(ticket.closed).to eq(false)
      expect(ticket.open?).to eq(true)
    end

    it 'is not open when it has been closed' do
      expect(closed_ticket.closed).to eq(true)
      expect(closed_ticket.open?).to eq(false)
    end
  end

  describe '#captured?' do
    it 'is not captured when an organization is not present' do
      expect(ticket.organization.present?).to eq(false)
      expect(ticket.captured?).to eq(false)
    end

    it 'is captured when an organization is present' do
      expect(ticket.captured?).to eq(false)
      ticket.organization = build(:organization)
      expect(ticket.captured?).to eq(true)
    end
  end

  describe '#to_s' do
    it 'returns a string identifying the ticket number' do
      expected_result = 'Ticket -1'
      ticket.id = -1
      expect(ticket.to_s).to eq(expected_result)
    end
  end

  describe '::open' do
    it 'returns tickets that are not closed and do not have an assigned organization' do
      open_ticket = create(:ticket)
      expect(open_ticket.closed).to be(false)
      expect(open_ticket.organization).to be(nil)
      open_tickets = Ticket.open
      expect(open_tickets).to include(open_ticket)
    end
  end

  describe '::closed' do
    it 'returns tickets that are closed' do
      closed_ticket = create(:closed_ticket)
      expect(closed_ticket.closed).to be(true)
      closed_tickets = Ticket.closed
      expect(closed_tickets).to include(closed_ticket)
    end
  end

  describe '::all_organization' do
    it 'returns tickets that are not closed but have an assigned organization' do
      ticket = create(:ticket)
      organization = create(:organization)
      ticket.organization = organization
      ticket.save
      expect(ticket.closed).to be(false)
      all_organization_tickets = Ticket.all_organization
      expect(all_organization_tickets).to include(ticket)
    end
  end

  describe '::organization' do
    it 'returns tickets assigned to a specific organization that are not closed' do
      ticket = create(:ticket)
      organization = create(:organization)
      ticket.organization = organization
      ticket.save
      expect(ticket.closed).to be(false)

      organization_tickets = Ticket.organization(organization.id)
      expect(organization_tickets).to include(ticket)
    end
  end

  describe '::closed_organization' do
    it 'returns tickets assigned to a specific organization that are closed' do
      closed_ticket = create(:closed_ticket)
      organization = create(:organization)
      closed_ticket.organization = organization
      closed_ticket.save
      expect(closed_ticket.closed).to be(true)

      closed_tickets = Ticket.closed_organization(organization.id)
      expect(closed_tickets).to include(closed_ticket)
    end
  end

  describe '::region' do
    it 'returns tickets that are in a specific region' do
      ticket = create(:ticket)
      region_tickets = Ticket.region(ticket.region_id)
      expect(region_tickets).to include(ticket)
    end
  end

  describe '::resource_category' do
    it 'returns tickets that have a specific resource category' do
      ticket = create(:ticket)
      resource_category_tickets = Ticket.resource_category(ticket.resource_category_id)
      expect(resource_category_tickets).to include(ticket)
    end
  end
end
