require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'attributes' do
    it 'belongs to an organization' do
      expect(user).to respond_to(:organization)
    end

    it 'sets a default role' do
      user.set_default_role
    end
  end

  describe '#to_s' do
    it 'returns the email' do
      expect(user.to_s).to eq(user.email)
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password) }
  end
end
